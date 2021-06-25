.. _kankyo-control:

##################################################
コントロールノードを作成
##################################################
Oracle VirtualBox 上に Ubuntu 20.04 LTS をインストールし、その上にコントロールノードを作成します。

.. _kankyo-control-packages:

**************************************************
使用パッケージ
**************************************************
今回使用したパッケージです。Ubuntu は Ubuntu Japanese Team が作成している日本語 Remix を使用しました。

- `VirtualBox-6.1.22-144080-Win.exe <https://www.virtualbox.org/wiki/Downloads>`_
- `Oracle_VM_VirtualBox_Extension_Pack-6.1.22.vbox-extpack <https://www.virtualbox.org/wiki/Downloads>`_
- `ubuntu-ja-20.04.1-desktop-amd64.iso <https://www.ubuntulinux.jp/News/ubuntu2004-ja-remix>`_

.. _kankyo-control-vm:

**************************************************
コントロールノード用仮想マシンの仕様
**************************************************
Ubuntu をインストールする仮想マシンの仕様です。

- ネットワークアダプター 2 を使用して管理対象ノードと通信します。
- ビデオメモリーを 128 MB に変更しています。デフォルトの 16 MB では解像度をあげたときにビデオメモリ不足になって何も表示されないことがあります。
- 他の項目は環境にあわせて値を設定ください。

.. image:: img/2021-06-16_04h36_56.png
   :scale: 66%

.. note::

   上記のコントロールノード用仮想マシンの仕様は一例です。ご自身の環境にあわせて変更ください。

.. _kankyo-control-deploy:

**************************************************
インストール
**************************************************

.. _kankyo-control-deploy-tejun:

手順
==================================================
大まかな手順です。手順 1. ～ 4. は一般的なことなので説明は省略します。

#. Oracle VirtualBox をインストール
#. Oracle VirtualBox に Oracle VM VirtualBox Extension Pack をインストール
#. 仮想マシンを作成し Ubuntu をインストール
#. Ubuntu に Guest Addition をインストール
#. Ansible をインストール
#. VS Code をインストール

.. _kankyo-control-deploy-ansible:

Ansible をインストール
==================================================
次の手順で作業を進めます。

#. :ref:`kankyo-control-deploy-ansible-guest`
#. 既存パッケージを更新
#. Ansible をインストール 

.. _kankyo-control-deploy-ansible-guest:

Guest Additions のインストール状態を確認
--------------------------------------------------

.. _kankyo-control-deploy-ansible-guest-command:

コマンド
^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^
.. code-block:: none

   modinfo vboxguest

.. _kankyo-control-deploy-ansible-guest-log:

実行ログ
^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^
.. literalinclude:: ./log/kankyo-control-deploy-ansible-guest.log
   :language: none
   :emphasize-lines: 1

.. _kankyo-control-deploy-ansible-update:

既存パッケージを更新
--------------------------------------------------

.. _kankyo-control-deploy-ansible-update-command:

コマンド
^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^
.. code-block:: none

   sudo apt -y update
   sudo apt -y dist-upgrade
   sudo reboot

.. _kankyo-control-deploy-ansible-update-log:

実行ログ
^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^
.. literalinclude:: ./log/kankyo-control-deploy-ansible-update.log
   :language: none
   :emphasize-lines: 1, 40, 81

.. _kankyo-control-deploy-ansible-install:

Ansible をインストール
--------------------------------------------------

.. _kankyo-control-deploy-ansible-install-command:

コマンド
^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^
.. code-block:: none

   sudo apt install -y python3-pip
   pip3 install ansible
   pip3 show ansible-core
   pip3 show ansible
   source ~/.profile
   ansible --version
   sudo apt -y install sshpass

.. _kankyo-control-deploy-ansible-install-log:

実行ログ
^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^
.. literalinclude:: ./log/kankyo-control-deploy-ansible-install.log
   :language: none
   :emphasize-lines: 1, 37, 72, 84, 96, 98, 109

.. _kankyo-control-deploy-ansible-config:

フィンガープリントを無視
--------------------------------------------------
.. note::

   フィンガープリントの設定は「 :ref:`managed-node-no-fingerprint` 」を参照ください。

.. _kankyo-control-deploy-ansible-config-command:

コマンド
^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^
.. code-block:: none

   mkdir ~/.ssh
   chmod 0700 ~/.ssh
   echo "Host *" > ~/.ssh/config
   echo "  StrictHostKeyChecking no" >> ~/.ssh/config
   echo "  UserKnownHostsFile=/dev/null" >> ~/.ssh/config
   chmod 0600 ~/.ssh/config
   ls -l ~/.ssh
   cat ~/.ssh/config

.. _kankyo-control-deploy-ansible-config-log:

実行ログ
^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^
.. literalinclude:: ./log/kankyo-control-deploy-ansible-config-log
   :language: none
   :emphasize-lines: 1-7, 10

.. _kankyo-control-network:

ネットワーク
==================================================
コントロールノードのネットワークの状態です。

.. literalinclude:: ./log/kankyo-control-network.log
   :language: none

.. _kankyo-control-network-nic-1:

ネットワーク アダプター 1
--------------------------------------------------
NAT 構成です。 Oracle VM VirtualBox が IP アドレスを割り当てています。

.. literalinclude:: ./log/kankyo-control-network-1.log
   :language: none

.. _kankyo-control-network-nic-2:

ネットワーク アダプター 2
--------------------------------------------------
内部ネットワーク (intnet) 構成です。手動で IP アドレスを割り当てています。

.. literalinclude:: ./log/kankyo-control-network-2.log
   :language: none

.. _kankyo-control-edit:

**************************************************
テキストエディタ
**************************************************
今回は　VS Code をインストールします。使い慣れたテキストエディタがあればそちらを使用ください。

.. _kankyo-control-edit-vscode-download:

VS Code をダウンロード
==================================================
`VS Code のダウンロードサイト <https://code.visualstudio.com/download>`_ から Debian,Ubuntu 用パッケージをダウンロードします。ダウンロード先は :file:`/home/$USER/ダウンロード` ディレクトリです。

.. image:: img/2021-06-11_22h24_57.png
   :scale: 60%

.. _kankyo-control-edit-vscode-install:

インストール
==================================================

.. _kankyo-control-edit-vscode-install-command:

コマンド
--------------------------------------------------
.. code-block:: none

   cd /home/$USER/ダウンロード
   ls -l
   sudo apt -y install ./code_1.56.2-1620838498_amd64.deb

.. _kankyo-control-edit-vscode-install-log:

実行ログ
--------------------------------------------------
.. literalinclude:: ./log/kankyo-control-edit-vscode-install.log
   :language: none
   :emphasize-lines: 1, 3, 7

.. _kankyo-control-edit-vscode-customize:

拡張機能
==================================================
VS Code は拡張機能が豊富にあります。その中からインストールしておいたほうが良いと思われる拡張機能を紹介します。

.. _kankyo-control-edit-vscode-customize-1:

Japanese Language Pack for visual Studio Code
--------------------------------------------------
メニューなどを日本語化します。

.. image:: img/2021-06-11_22h38_00.png
   :scale: 60%

.. _kankyo-control-edit-vscode-customize-2:

indent-rainbow
--------------------------------------------------
インデントごとに色分けします。

.. image:: img/2021-06-11_22h38_46.png
   :scale: 60%

.. _kankyo-control-edit-vscode-customize-3:

Github Theme
--------------------------------------------------
VS Code 全体の見た目を変更します。

.. image:: img/2021-06-11_22h40_52.png
   :scale: 60%
