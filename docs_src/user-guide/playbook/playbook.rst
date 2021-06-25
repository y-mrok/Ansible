.. _playbook:

##################################################
プレイブック
##################################################
- :ref:`YAML <yaml>` を使用して記述する
- 複数の :ref:`アドホックコマンド <adhoc>` を自動的に順番に実行するイメージ
- 実行単位の大きい順から「プレイブック」、「プレイ」、「タスク」
- Ansible は :command:`ansible-playbook` コマンドを使用し、インベントリファイルに記載した管理対象ノード上でプレイブックを実行する

.. toctree::
   :maxdepth: 2

   ./playbook-no-kosei
   ./play
   ./4-tu-no-section
   ./ansible-playbook-command
   ./bekitousei
