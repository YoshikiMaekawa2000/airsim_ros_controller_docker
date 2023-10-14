# airsim_ros_controller_docker

## step1 
`ue4-docker`をLinuxシステムにインストールする手順は以下の通りです：

1. **Docker CEのインストール:**  
   - まず、Dockerの公式インストール手順に従って、お使いのLinuxディストリビューション用のDocker CEをインストールしてください。以下のリンクからお使いのディストリビューションに対応するインストール手順を参照できます:
     - [CentOS](https://docs.docker.com/engine/install/centos/)
     - [Debian](https://docs.docker.com/engine/install/debian/)
     - [Fedora](https://docs.docker.com/engine/install/fedora/)
     - [Ubuntu](https://docs.docker.com/engine/install/ubuntu/)
   - Dockerをインストールした後、[Linuxのポストインストール手順](https://docs.docker.com/engine/install/linux-postinstall/)ページの指示に従って、非rootユーザーがDockerコマンドを実行できるように設定してください。このステップは、NVIDIAコンテナツールキットを使用してクラウドレンダリングを実行する際にオーディオサポートを有効にするために必要です[Adam Rehn Docs](https://docs.adamrehn.com/ue4-docker/configuration/linux)。

2. **Python 3.6またはそれ以降のバージョンのインストール:**
   - これらのLinuxディストリビューションの古いバージョンでは、デフォルトでPython 3.6がシステムリポジトリに含まれていない場合があります。古いディストリビューションを使用している場合は、新しいバージョンのPythonを提供するコミュニティリポジトリを設定する必要があるかもしれません。
     - CentOSの場合:
       ```bash
       sudo yum install python3 python3-devel python3-pip
       ```
     - DebianおよびUbuntuの場合:
       ```bash
       sudo apt-get install python3 python3-dev python3-pip
       ```
     - Fedoraの場合:
       ```bash
       sudo dnf install python3 python3-devel python3-pip
       ```
   - 上記のコマンドにより、Python 3とpip（Pythonのパッケージマネージャ）がインストールされます[Adam Rehn Docs](https://docs.adamrehn.com/ue4-docker/configuration/linux)。

3. **ue4-dockerのインストール:**
   - ue4-docker Pythonパッケージをインストールするには、以下のコマンドを実行します:
     ```bash
     sudo pip3 install ue4-docker
     ```
   - このコマンドにより、ue4-dockerがシステムにインストールされます[Adam Rehn Docs](https://docs.adamrehn.com/ue4-docker/configuration/linux)。

4. **Linuxファイアウォールの自動設定:**
   - ホストシステムでアクティブなファイアウォールが実行されており、ポート9876へのアクセスがブロックされている場合（ue4-sourceイメージのビルド中に必要）、このポートへのアクセスを許可するファイアウォールルールを作成する必要があります。`ue4-docker setup`コマンドを使用すると、このシナリオを検出し、適切なファイアウォール設定を自動的に実行します:
     ```bash
     sudo ue4-docker setup
     ```
   - 注意: 新しく作成されたファイアウォールルールをホストシステムが再起動した後も保持するには、`iptables-persistent`サービスをインストールする必要があります[Adam Rehn Docs](https://docs.adamrehn.com/ue4-docker/configuration/linux)。

これらの手順に従って、`ue4-docker`をインストールし、Linuxファイアウォールを適切に設定することで、`ue4-docker`を使用してUnreal Engineのコンテナイメージをビルドおよび実行する準備が整います。

