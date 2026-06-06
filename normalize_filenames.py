#!/usr/bin/env python3
import os
import re
from pathlib import Path

def normalize_filename(filename):
    """
    Normaliza um nome de arquivo para kebab-case.
    - Remove extensão
    - Converte para lowercase
    - Remove/substitui caracteres especiais
    - Remove acentos
    - Substitui espaços por hífens
    """
    name, ext = os.path.splitext(filename)
    
    # Remover acentos básicos
    replacements = {
        'á': 'a', 'à': 'a', 'ã': 'a', 'â': 'a',
        'é': 'e', 'è': 'e', 'ê': 'e',
        'í': 'i', 'î': 'i',
        'ó': 'o', 'ò': 'o', 'õ': 'o', 'ô': 'o',
        'ú': 'u', 'û': 'u',
        'ç': 'c',
    }
    
    for accented, normal in replacements.items():
        name = name.replace(accented, normal)
        name = name.replace(accented.upper(), normal)
    
    # Converter para lowercase
    name = name.lower()
    
    # Remover/substituir caracteres especiais, mantendo hífens e sublinhados
    name = re.sub(r'[^\w\s\-]', '', name)
    
    # Substituir espaços por hífens
    name = re.sub(r'\s+', '-', name)
    
    # Remover hífens múltiplos
    name = re.sub(r'-+', '-', name)
    
    # Remover hífens no início/fim
    name = name.strip('-')
    
    return name + ext

def process_directory(root_dir):
    """Processa todos os arquivos .md no diretório."""
    changes = []
    
    for dirpath, dirnames, filenames in os.walk(root_dir):
        for filename in filenames:
            if filename.endswith('.md'):
                old_path = os.path.join(dirpath, filename)
                normalized_name = normalize_filename(filename)
                
                # Pular se o nome já está normalizado
                if normalized_name == filename:
                    continue
                
                new_path = os.path.join(dirpath, normalized_name)
                
                # Pular se o arquivo de destino já existe
                if os.path.exists(new_path):
                    print(f"⚠️  Arquivo já existe (pulando): {new_path}")
                    continue
                
                try:
                    os.rename(old_path, new_path)
                    changes.append((filename, normalized_name))
                    print(f"✅ {filename} → {normalized_name}")
                except Exception as e:
                    print(f"❌ Erro ao renomear {filename}: {e}")
    
    return changes

if __name__ == '__main__':
    root = 'docs'
    print("🔄 Normalizando nomes de arquivos...\n")
    changes = process_directory(root)
    
    print(f"\n✨ Total de arquivos renomeados: {len(changes)}")
