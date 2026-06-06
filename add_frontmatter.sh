#!/bin/bash

# Dicionário de categorias e tags
declare -A CATEGORIES=(
    [docker]="docker"
    [linux]="linux"
    [wsl]="wsl"
    [raspberry-pi]="raspberry-pi"
    [networking]="networking"
    [monitoring]="monitoring"
    [voip]="voip"
    [security]="security"
    [overview]="overview"
    [references]="references"
)

# Função para gerar front-matter
generate_frontmatter() {
    local file=$1
    local category=$2
    local filename=$(basename "$file" .md)
    
    # Converter nome do arquivo em título
    local title=$(echo "$filename" | sed 's/-/ /g' | sed 's/\b\(.\)/\u\1/g')
    
    # Gerar descrição padrão baseado na categoria
    case $category in
        docker)
            local desc="Documentação sobre Docker e containerização"
            local tags="docker, containers, devops"
            ;;
        linux)
            local desc="Guia sobre Linux e administração de sistemas"
            local tags="linux, commands, administration, shell"
            ;;
        wsl)
            local desc="Guia para Windows Subsystem for Linux"
            local tags="wsl, windows, linux, setup"
            ;;
        raspberry-pi)
            local desc="Tutoriais e guias para Raspberry Pi"
            local tags="raspberry-pi, arm, linux, embedded"
            ;;
        networking)
            local desc="Configuração de rede e infraestrutura"
            local tags="networking, infrastructure, devops, server"
            ;;
        monitoring)
            local desc="Ferramentas de monitoramento e diagnóstico"
            local tags="monitoring, observability, diagnostic, tools"
            ;;
        voip)
            local desc="Sistemas de telefonia IP e PBX"
            local tags="voip, asterisk, freepbx, pbx, telephony"
            ;;
        security)
            local desc="Segurança e permissões em Linux"
            local tags="security, permissions, sudo, access-control"
            ;;
        *)
            local desc="Documentação técnica"
            local tags="documentation, reference"
            ;;
    esac
    
    # Retornar front-matter
    cat <<EOF
---
title: $title
description: $desc
category: $category
tags: [$tags]
---

EOF
}

# Processar arquivos
for dir in docs/*/; do
    category=$(basename "$dir")
    
    if [[ ! -v CATEGORIES[$category] ]]; then
        continue
    fi
    
    for file in "$dir"*.md; do
        # Pular se arquivo não existe ou já tem front-matter
        [[ ! -f "$file" ]] && continue
        
        # Verificar se já tem front-matter
        if head -1 "$file" | grep -q "^---"; then
            echo "⏭️  $file (já possui front-matter)"
            continue
        fi
        
        # Criar novo arquivo com front-matter
        local temp_file="${file}.tmp"
        generate_frontmatter "$file" "$category" > "$temp_file"
        cat "$file" >> "$temp_file"
        
        # Substituir arquivo original
        mv "$temp_file" "$file"
        echo "✅ $file"
    done
done

echo "✨ Concluído!"
