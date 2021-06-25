.. _ansible-module-no-jikko:

##################################################
アドホックコマンドで Ansible のモジュールを実行
##################################################
:command:`adhoc` コマンドで Ansible のモジュールを管理対象ノード上で実行します。:ref:`使用するインベントリは Linux コマンドを実行したときと同じ内容 <linux-commmand-no-jikko-inventory>` です。

.. _ansible-module-no-jikko-kobun:

**************************************************
構文
**************************************************
:ref:`ansible コマンドの構文 <ansible-command-kobun>` から主に使用するパラメーターを抽出・再構成しました。パラメーターの意味は「 :ref:`ansible-command-omona-parameter` 」を確認ください。

.. code-block:: none

   usage: ansible pattern [-i INVENTORY] [-m MODULE_NAME] [-a MODULE_ARGS] [-b]

.. list-table::
   :widths: 1, 8
   :header-rows: 1

   * - パラメーター
     - 設定内容
   * - -m
     - 実行するAnsible のモジュールを指定する
   * - -a
     - | 実行する Ansible のモジュールに渡すパラメーターを設定する
       | パラメーターとパラメーターに設定する値は ``=`` で結合する
       | 複数のパラメーターを設定する場合、パラメータ間に半角空白を入れる

.. _ansible-module-no-jikko-siyorei:

**************************************************
使用例
**************************************************
コントロールノードからすべての管理対象ノードに ping を実行する
----------------------------------------------------------------------------------------------------
.. code-block:: none

   piyo@vmpc:~/example/ex3$ ansible all -i hosts.yml -m ansible.builtin.ping
   hydrogen | SUCCESS => {
       "ansible_facts": {
           "discovered_interpreter_python": "/usr/libexec/platform-python"
       },
       "changed": false,
       "ping": "pong"
   }
   lithium | SUCCESS => {
       "ansible_facts": {
           "discovered_interpreter_python": "/usr/libexec/platform-python"
       },
       "changed": false,
       "ping": "pong"
   }
   helium | SUCCESS => {
       "ansible_facts": {
           "discovered_interpreter_python": "/usr/libexec/platform-python"
       },
       "changed": false,
       "ping": "pong"
   }
   piyo@vmpc:~/example/ex3$ 

.. admonition:: ``ansible.builtin.ping`` モジュールが実行すること

   - 管理対象ノードとの疎通確認
   - コントロールノードから管理対象ノードに ssh 接続できることの確認
   - :ref:`管理対象ノードが Ansible で管理されるための要件 <managed-node-no-yoken>` を満たしていることの確認

管理対象ノード hydrogen に Apache をインストールする
----------------------------------------------------------------------------------------------------
.. list-table:: ansible.builtin.dnf モジュールのパラメーター
   :header-rows: 1
   :widths: 1, 6

   * - パラメーター
     - 説明
   * - name
     - 対象のパッケージを指定する
   * - state
     - | ・present : パッケージがインストールされた状態にする
       | ・latest : 最新版のパッケージがインストールされた状態にする
       | ・absent : パッケージがアンインストールされた状態にする

.. code-block:: none

   piyo@vmpc:~/example/ex3$ ansible hydrogen -i hosts.yml -m ansible.builtin.dnf -a 'name=httpd state=present' -b
   hydrogen | CHANGED => {
       "ansible_facts": {
           "discovered_interpreter_python": "/usr/libexec/platform-python"
       },
       "changed": true,
       "msg": "",
       "rc": 0,
       "results": [
           "Installed: httpd-2.4.37-30.module_el8.3.0+561+97fdbbcc.x86_64",
           "Installed: httpd-filesystem-2.4.37-30.module_el8.3.0+561+97fdbbcc.noarch",
           "Installed: centos-logos-httpd-80.5-2.el8.noarch",
           "Installed: httpd-tools-2.4.37-30.module_el8.3.0+561+97fdbbcc.x86_64",
           "Installed: apr-1.6.3-11.el8.x86_64",
           "Installed: apr-util-1.6.1-6.el8.x86_64",
           "Installed: mod_http2-1.15.7-2.module_el8.3.0+477+498bb568.x86_64",
           "Installed: apr-util-bdb-1.6.1-6.el8.x86_64",
           "Installed: mailcap-2.1.48-3.el8.noarch",
           "Installed: apr-util-openssl-1.6.1-6.el8.x86_64"
       ]
   }
   piyo@vmpc:~/example/ex3$ 

管理対象ノード hydrogen で Apache のサービスを有効にする かつ 起動時にサービスを開始する
----------------------------------------------------------------------------------------------------
.. list-table:: ansible.builtin.systemd モジュールのパラメーター
   :header-rows: 1
   :widths: 1, 6

   * - パラメーター
     - 説明
   * - name
     - 対象のサービス名を指定する
   * - state
     - | ・started : サービスを開始した状態にする
       | ・stopped : サービスを停止した状態にする
       | ・restarted : サービスの状態に関係なく、サービスを再起動した状態にする
       | ・reloaded : サービスの状態に関係なく、サービスをリロードした状態にする
   * - enabled
     - | 管理対象ノードの起動時にサービスを起動するか否かを指定する
       | ・yes : 起動する
       | ・no : 起動しない

.. code-block:: none

   piyo@vmpc:~/example/ex3$ ansible hydrogen -i hosts.yml -m ansible.builtin.systemd -a 'name=httpd.service state=started enabled=yes' -b
   hydrogen | CHANGED => {
       "ansible_facts": {
           "discovered_interpreter_python": "/usr/libexec/platform-python"
       },
       "changed": true,
       "enabled": true,
       "name": "httpd.service",
       "state": "started",
       "status": {
           "ActiveEnterTimestampMonotonic": "0",
           "ActiveExitTimestampMonotonic": "0",
           "ActiveState": "inactive",
           
           中略

           "Wants": "httpd-init.service",
           "WatchdogTimestampMonotonic": "0",
           "WatchdogUSec": "0"
       }
   }
   piyo@vmpc:~/example/ex3$ 

ファイアウォールで http サービスを開放する
----------------------------------------------------------------------------------------------------
.. list-table:: ansible.posix.firewalld モジュールのパラメーター
   :header-rows: 1
   :widths: 1, 6

   * - パラメーター
     - 説明
   * - service
     - | 対象のサービス名を指定する
       | 指定可能なサービス名は :command:`firewall-cmd --get-services` で確認できるものだけである
   * - permanent 
     - | 再起動後も設定した内容を保持するか否かを指定する
       | ・yes : 保持する
       | ・no : 保持しない
   * - state
     - | ・enabled : 設定を有効にする
       | ・disabled : 設定を無効にする
   * - immediate
     - | ``permanent: yes`` のとき設定をすぐに適用するか否かを指定する
       | ・yes : 適用する
       | ・No : 適用しない

.. code-block:: none

   piyo@vmpc:~/example/ex3$ ansible hydrogen -i hosts.yml -m ansible.posix.firewalld -a 'service=http permanent=yes state=enabled immediate=yes' -b
   hydrogen | CHANGED => {
       "ansible_facts": {
           "discovered_interpreter_python": "/usr/libexec/platform-python"
       },
       "changed": true,
       "msg": "Permanent and Non-Permanent(immediate) operation, Changed service http to enabled"
   }
   piyo@vmpc:~/example/ex3$ 
