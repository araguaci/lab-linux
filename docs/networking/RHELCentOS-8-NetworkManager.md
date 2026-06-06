# RHEL/CentOS 8 で NetworkManager を使用してネットワークを管理する方法

Source: [https://linux-jp.org/?p=1367](https://linux-jp.org/?p=1367)

---

__RHEL__ と __CentOS 8__ では、ネットワーク サービスは __NetworkManager__ デーモンによって管理され、ネットワーク デバイスを動的に構成および制御し、接続を維持するために使用されます。利用可能な場合はアクティブになります。

__NetworkManager__ には、コマンドライン インターフェイスとグラフィカル ユーザー インターフェイス ツールの両方を使用した簡単なネットワーク セットアップと管理のサポート、ネットワーク構成のクエリと制御を可能にする D-Bus を介した API の提供、サポートなど、数多くの利点があります。構成の柔軟性などを実現します。

さらに、__ネットワーク マネージャー__はファイルとコックピット Web コンソールを使用して構成することもでき、接続ステータスに基づいて他のサービスを開始または停止するためのカスタム スクリプトの使用をサポートします。

__こちらもお読みください__: 「nmcli」ツールを使用してネットワーク接続を構成および管理する方法

先に進む前に、__CentOS/RHEL 8__ のネットワークに関して注意すべきその他の重要な点を以下に示します。

*   従来の __ifcfg__ タイプの設定 (__ifcfg-eth0__、__ifcfg-enp0s3__ など) ファイルは引き続きサポートされます。
*   ネットワーク スクリプトは非推奨となり、デフォルトでは提供されなくなりました。
*   最小限のインストールでは、nmcli ツール経由で NetworkManager を呼び出す新しいバージョンの __ifup__ スクリプトと __ifdown__ スクリプトが提供されます。
*   __ifup__ スクリプトと __ifdown__ スクリプトを実行するには、__NetworkManager__ が実行されている必要があります。

### CentOS/RHEL 8 への NetworkManager のインストール

__NetworkManager__ は__CentOS/RHEL 8__ の基本インストールにプレインストールされている必要があります。それ以外の場合は、図に示すように DNF パッケージ マネージャーを使用してインストールできます。

```
# dnf install NetworkManager
```

![](https://linux-jp.org/common-images/manage-networking-with-networkmanager-in-rhel-centos/Install-Network-Manager-in-CentOS.png)

__NetworkManager__ のグローバル設定ファイルは __/etc/NetworkManager/NetworkManager.conf__ にあり、追加の設定ファイルは __/etc/NetworkManager/__ にあります。 >。

![](https://linux-jp.org/common-images/manage-networking-with-networkmanager-in-rhel-centos/NetworkManager-Configuration-Files.png)

### CentOS/RHEL 8 で Systemctl を使用して NetworkManager を管理する

__CentOS/RHEL 8__ や__systemd__ (システムおよびサービス マネージャー) を採用したその他の最新の Linux システムでは、サービスは systemctl ツールを使用して管理されます。

以下は、__NetworkManager__ サービスの管理に役立つ __systemctl コマンド__です。

#### NetworkManagerの状態を確認する

__CentOS/RHEL 8__ の最小限のインストールでは、__NetworkManager__ が起動され、デフォルトで起動時に自動的に起動するように有効になっている必要があります。次のコマンドを使用すると、NetworkManager がアクティブか有効かどうかを確認し、NetworkManager の実行時ステータス情報を出力できます。

```
# systemctl is-active NetworkManager
systemctl is-enabled NetworkManager
systemctl status NetworkManager 
```

![](https://linux-jp.org/common-images/manage-networking-with-networkmanager-in-rhel-centos/Check-NetworkManager-Service.png)

#### NetworkManagerの起動

__NetworkManager__ が実行されていない場合は、実行するだけで起動できます。

```
# systemctl start NetworkManager
```

#### NetworkManagerの停止

何らかの理由で__NetworkManager__を停止または非アクティブ化するには、次のコマンドを実行します。

```
# systemctl stop NetworkManager
```

#### NetworkManagerの再起動

インターフェイス設定ファイルまたは NetworkManager デーモンの設定 (通常は __/etc/NetworkManager/__ ディレクトリにあります) に変更を加えた場合は、NetworkManager を再起動 (停止してから開始) して変更を適用できます。示されています。

```
# systemctl restart NetworkManager
```

#### NetworkManagerのリロード中

サービスを再起動せずに __NetworkManager__ デーモンの構成 (systemd のユニット構成ファイルではない) を再ロードするには、次のコマンドを実行します。

```
# systemctl reload NetworkManager
```

### NetworkManager ツールの使用と ifcfg ファイルの操作

__NetworkManager__ は、ユーザーが操作するためのいくつかのツールをサポートしています。

1.  nmcli – ネットワークの構成に使用されるコマンドライン ツール。
2.  nmtui – シンプルな Curses ベースのテキスト ユーザー インターフェイス。newtwork インターフェイス接続の設定と管理にも使用されます。
3.  その他のツールには、__nm-connection-editor__、__control-center__、__ネットワーク接続アイコン__などがあります (すべて GUI の下にあります)。

__NetworkManager__ によって検出されたデバイスを一覧表示するには、__nmcli コマンド__を実行します。

```
 
nmcli device 
OR
nmcli device status
```

![](https://linux-jp.org/common-images/manage-networking-with-networkmanager-in-rhel-centos/List-Devices-Detected-by-NetworkManager.png)

すべてのアクティブな接続を表示するには、次のコマンドを実行します (`-a` を指定しないと、使用可能な接続プロファイルがリストされることに注意してください)。

```
# nmcli connection show -a
```

![](https://linux-jp.org/common-images/manage-networking-with-networkmanager-in-rhel-centos/View-Active-Network-Connections.png)

#### CentOS/RHEL 8 で静的 IP アドレスを設定する

ネットワーク インターフェイス固有の設定ファイルは、__/etc/sysconfig/network-scripts/__ ディレクトリにあります。これらのファイルを編集して、たとえば、CentOS/RHEL 8 サーバーの静的 IP アドレスを設定できます。

```
# vi /etc/sysconfig/network-scripts/ifcfg-enp0s3
```

静的 IP アドレスを設定するためのサンプル構成を次に示します。

```
TYPE=Ethernet
PROXY_METHOD=none
BROWSER_ONLY=no
BOOTPROTO=none
DEFROUTE=yes
IPV4_FAILURE_FATAL=no
IPV6INIT=yes
IPV6_AUTOCONF=yes
IPV6_DEFROUTE=yes
IPV6_FAILURE_FATAL=no
IPV6_ADDR_GEN_MODE=stable-privacy
NAME=enp0s3
UUID=e81c46b7-441a-4a63-b695-75d8fe633511
DEVICE=enp0s3
ONBOOT=yes
IPADDR=192.168.0.110
PREFIX=24
GATEWAY=192.168.0.1
DNS1=8.8.8.8
PEERDNS=no
```

![](https://linux-jp.org/common-images/manage-networking-with-networkmanager-in-rhel-centos/View-Network-Interface-Configuration.png)

変更を保存した後、新しい変更を適用するには、すべての接続プロファイルを再ロードするか、__ネットワーク マネージャー__を再起動する必要があります。

```
# nmcli connection reload
OR
systemctl restart NetworkManager
```

### ネットワーク接続に基づいたネットワーク サービス/スクリプトの開始または停止

__NetworkManager__ には、ユーザーがネットワーク接続に基づいてサービス (__NFS__、__SMB__ など) や単純なスクリプトを実行できるようにする便利なオプションがあります。

たとえば、sshfs を使用してリモート ディレクトリをローカルに自動的にマウントする場合、ネットワークを切り替えた後に SMB 共有をマウントするか、NFS 共有をマウントします。このようなネットワーク サービスは、__NetworkManager__ が起動して実行される (すべての接続がアクティブになる) までは実行されないようにしたい場合があります。

この機能は__NetworkManager-dispatcher__ サービスによって提供されます (システム起動時に自動的に開始するには、このサービスを開始して有効にする必要があります)。サービスが実行されたら、スクリプトを __/etc/NetworkManager/dispatcher.d__ ディレクトリに追加できます。

すべてのスクリプトは実行可能および書き込み可能であり、root によって所有されている必要があります。次に例を示します。

```
# chown root:root /etc/NetworkManager/dispatcher.d/10-nfs-mount.sh
chmod 755 /etc/NetworkManager/dispatcher.d/10-nfs-mount.sh
```

__重要__: ディスパッチャ スクリプトは、接続時にはアルファベット順に実行され、切断時には逆アルファベット順に実行されます。

#### 従来のネットワーク スクリプトの使用

前述したように、ネットワーク スクリプトは__CentOS/RHEL 8__ で非推奨となり、デフォルトではインストールされません。それでも n__network スクリプト__を使用したい場合は、__network-scripts__ パッケージをインストールする必要があります。

```
# yum install network-scripts
```

インストールされると、このパッケージは、__nmcli__ ツールを介して __NetworkManager__ を呼び出す __ifup__ スクリプトと __ifdown__ スクリプトの新しいバージョンを提供します。以上見てきました。これらのスクリプトを実行するには、__NetworkManager__ が実行されている必要があることに注意してください。

詳細については、__systemctl__ および __NetworkManager__ のマニュアル ページを参照してください。

```
# man systemctl
man NetworkManager
```

この記事で準備したのはこれだけです。以下のフィードバック フォームを使用して、各点について説明を求めたり、質問したり、このガイドに追加したりすることができます。
