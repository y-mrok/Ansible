.. _inventory:

##################################################
インベントリ
##################################################
- Ansible を実行する管理対象ノードのリスト
- 管理対象ノードに接続するための情報（ IP アドレス、接続アカウント ．．．）などを指定する
- 管理対象ノードをまとめたグループを定義できる
- インベントリファイルは「ホストファイル」と呼ぶこともある
- デフォルトのインベントリファイルは :file:`/etc/ansible/hosts`
- ``ansible`` コマンドや ``ansible-playbook`` コマンドなどの ``-i`` オプションまたは ``--inventory`` オプションで独自のインベントリファイルを指定できる
- インベントリファイル内の管理対象ホストやグループがアドホックコマンドやプレイの実行対象になる

.. toctree::
   :maxdepth: 2

   ./inventory-no-kihon
   ./inventory-no-group
   ./inventory-hensu-no-wariate
   ./inventory-no-seiri
   ./ansible-inventory-command
   ./fukusu-no-inventory
   ./inventory-hostname
