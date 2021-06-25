.. _ansible-playbook-command:

##################################################
ansible-playbook コマンド
##################################################

.. _ansible-playbook-command-kobun:

**************************************************
構文
**************************************************
:command:`ansible-playbook -h` の表示内容です。

.. code-block:: none

   usage: ansible-playbook [-h] [--version] [-v] [-k] [--private-key PRIVATE_KEY_FILE] [-u REMOTE_USER] [-c CONNECTION] [-T TIMEOUT]
                           [--ssh-common-args SSH_COMMON_ARGS] [--sftp-extra-args SFTP_EXTRA_ARGS] [--scp-extra-args SCP_EXTRA_ARGS]
                           [--ssh-extra-args SSH_EXTRA_ARGS] [--force-handlers] [--flush-cache] [-b] [--become-method BECOME_METHOD]
                           [--become-user BECOME_USER] [-K] [-t TAGS] [--skip-tags SKIP_TAGS] [-C] [--syntax-check] [-D] [-i INVENTORY] [--list-hosts]
                           [-l SUBSET] [-e EXTRA_VARS] [--vault-id VAULT_IDS] [--ask-vault-password | --vault-password-file VAULT_PASSWORD_FILES]
                           [-f FORKS] [-M MODULE_PATH] [--list-tasks] [--list-tags] [--step] [--start-at-task START_AT_TASK]
                           playbook [playbook ...]
   
   Runs Ansible playbooks, executing the defined tasks on the targeted hosts.
   
   positional arguments:
     playbook              Playbook(s)
   
   optional arguments:
     --ask-vault-password, --ask-vault-pass
                           ask for vault password
     --flush-cache         clear the fact cache for every host in inventory
     --force-handlers      run handlers even if a task fails
     --list-hosts          outputs a list of matching hosts; does not execute anything else
     --list-tags           list all available tags
     --list-tasks          list all tasks that would be executed
     --skip-tags SKIP_TAGS
                           only run plays and tasks whose tags do not match these values
     --start-at-task START_AT_TASK
                           start the playbook at the task matching this name
     --step                one-step-at-a-time: confirm each task before running
     --syntax-check        perform a syntax check on the playbook, but do not execute it
     --vault-id VAULT_IDS  the vault identity to use
     --vault-password-file VAULT_PASSWORD_FILES, --vault-pass-file VAULT_PASSWORD_FILES
                           vault password file
     --version             show program's version number, config file location, configured module search path, module location, executable location and
                           exit
     -C, --check           don't make any changes; instead, try to predict some of the changes that may occur
     -D, --diff            when changing (small) files and templates, show the differences in those files; works great with --check
     -M MODULE_PATH, --module-path MODULE_PATH
                           prepend colon-separated path(s) to module library (default=~/.ansible/plugins/modules:/usr/share/ansible/plugins/modules)
     -e EXTRA_VARS, --extra-vars EXTRA_VARS
                           set additional variables as key=value or YAML/JSON, if filename prepend with @
     -f FORKS, --forks FORKS
                           specify number of parallel processes to use (default=5)
     -h, --help            show this help message and exit
     -i INVENTORY, --inventory INVENTORY, --inventory-file INVENTORY
                           specify inventory host path or comma separated host list. --inventory-file is deprecated
     -l SUBSET, --limit SUBSET
                           further limit selected hosts to an additional pattern
     -t TAGS, --tags TAGS  only run plays and tasks tagged with these values
     -v, --verbose         verbose mode (-vvv for more, -vvvv to enable connection debugging)
   
   Connection Options:
     control as whom and how to connect to hosts
   
     --private-key PRIVATE_KEY_FILE, --key-file PRIVATE_KEY_FILE
                           use this file to authenticate the connection
     --scp-extra-args SCP_EXTRA_ARGS
                           specify extra arguments to pass to scp only (e.g. -l)
     --sftp-extra-args SFTP_EXTRA_ARGS
                           specify extra arguments to pass to sftp only (e.g. -f, -l)
     --ssh-common-args SSH_COMMON_ARGS
                           specify common arguments to pass to sftp/scp/ssh (e.g. ProxyCommand)
     --ssh-extra-args SSH_EXTRA_ARGS
                           specify extra arguments to pass to ssh only (e.g. -R)
     -T TIMEOUT, --timeout TIMEOUT
                           override the connection timeout in seconds (default=10)
     -c CONNECTION, --connection CONNECTION
                           connection type to use (default=smart)
     -k, --ask-pass        ask for connection password
     -u REMOTE_USER, --user REMOTE_USER
                           connect as this user (default=None)
   
   Privilege Escalation Options:
     control how and which user you become as on target hosts
   
     --become-method BECOME_METHOD
                           privilege escalation method to use (default=sudo), use `ansible-doc -t become -l` to list valid choices.
     --become-user BECOME_USER
                           run operations as this user (default=root)
     -K, --ask-become-pass
                           ask for privilege escalation password
     -b, --become          run operations with become (does not imply password prompting)

.. _ansible-playbook-command-omona-parameter:

**************************************************
主なパラメーター
**************************************************
.. list-table::
   :widths: 1, 3
   :header-rows: 1

   * - パラメーター
     - 意味
   * - | -i
       | --inventory
       | --inventory-file
     - | ・ 対象になるインベントリファイルを指定する
       | ・ IP アドレスや名前解決が可能な場合はホスト名の指定も可能
       | ・ IP アドレスはホスト名を指定する場合の最後は "," にする
   * - playbook
     - 実行するプレイブックファイルを指定する
   * - | -c
       | --connection
     - | ・ 対象ノードに接続するときのコネクションタイプを指定する
       | ・ default = smart
       | ・ コントロールノード = local
   * - | -l
       | --limit
     - targets セクションの ``hosts`` ディレクティブに指定したパターンの結果に対し、さらに実行対象になる管理対象ノードを絞り込む 
   * - --syntax-check
     - プレイブックの構文チェックを行う（実行はしない）
   * - --list-tasks
     - 実行対象のタスクの一覧を表示します（実行はしない）
   * - | -t
       | --tags
     - 指定したタグを設定したタスクを実行する
   * - --skip-tags
     - 指定したタグを設定したタスクを実行しない（スキップする）
   * - | --ask-vault-password
       | --ask-vault-pass
     - 実行時に VAULT パスワードを入力する
   * - | --vault-password-filename
       | --vault-pass-file
     - 実行時に VAULT パスワードを記録したファイルを指定する

.. _ansible-playbook-command-no-jikko:

**************************************************
コマンドの実行
**************************************************

.. _ansible-playbook-command-no-jikko-inventory-playbook:

インベントリファイルとプレイブックファイル
==================================================
- インベントリファイル：hosts.yml

.. literalinclude:: ./yaml/hosts1.yml
   :language: yaml

- プレイブックファイル：web.yml

.. literalinclude:: ./yaml/web.yml
   :language: yaml

.. _ansible-playbook-command-no-jikko-execute:

実行
==================================================

実行ログ
--------------------------------------------------
.. literalinclude:: ./log/web.log
   :language: none

実行順序
--------------------------------------------------
- タスクは記述順に実行する
- 実行対象のすべての管理対象ノードでタスクを実行後に次のタスクの実行に移る
- タスクの実行に失敗した管理対象ノードは、失敗したタスク以降のタスクは実行しない（失敗したタスクで実行が終了する）

"name" ディレクティブの確認
--------------------------------------------------
- ``name`` ディレクティブに設定した文字列は実行ログに出力される
- "Gathering Facts" はファクト変数を収集するタスク

.. code-block:: none

   PLAY [Building a Web Server] *************************************************************************************************************************
   
   TASK [Gathering Facts] *******************************************************************************************************************************
   
   TASK [Install Apache] ********************************************************************************************************************************
   
   TASK [Enabling Apache services and starting services at startup] *************************************************************************************
   
   TASK [Open up the http service in the firewall] ******************************************************************************************************

タスクの実行結果
--------------------------------------------------
.. code-block:: none

   TASK [Gathering Facts] *******************************************************************************************************************************
   ok: [lithium]
   ok: [helium]
   
   TASK [Install Apache] ********************************************************************************************************************************
   changed: [lithium]
   changed: [helium]

管理対象ノードごとにタスクを実行した結果が表示されます。

.. list-table:: 主な実行結果
   :widths: 1, 8
   :header-rows: 1

   * - 実行結果
     - 意味
   * - ok
     - | ・タスクは正常に実行した
       | ・タスクを実行したが、管理対象ノードの状態は変更されなかった
   * - changed
     - | ・タスクは正常に実行した
       | ・タスクを実行した結果、管理対象ノードの状態が変更された
   * - skipping
     - | ・タスクの実行をスキップした
       | ・ "when" ディレクティブに設定した条件が不成立のときなどでこの結果になる
   * - failed
     - ・タスクの実行に失敗した

実行結果のまとめ
--------------------------------------------------
- 実行ログの最後に、管理対象ノードごとにタスクの実行結果のサマリを表示する

.. code-block:: none

   PLAY RECAP *******************************************************************************************************************************************
   helium                     : ok=4    changed=3    unreachable=0    failed=0    skipped=0    rescued=0    ignored=0   
   lithium                    : ok=4    changed=3    unreachable=0    failed=0    skipped=0    rescued=0    ignored=0   

.. list-table:: 主な実行結果
   :widths: 1, 8
   :header-rows: 1

   * - 実行結果
     - 意味
   * - ok 
     - タスクの実行結果の "ok" と "changed" の合計数 
   * - changed
     - タスクの実行結果 "changed" の数
   * - unreachable
     - :ref:`タスクの実行時にが管理対象ノードに接続できかなった数 <errorhandling-ignore-unreachable-play-recap>`
   * - failed
     - タスクの実行に失敗した数
   * - skipped
     - タスクの実行をスキップした数
   * - rescued
     - :ref:`rescue ディレクティブを実行した数 <block-rescue-play-recap>`
   * - ignored
     - :ref:`タスクで発生したエラーを無視した数 <errorhandling-ignore-errors-play-recap>`

"ok" , "changed" , "skipping" だけがカウントされていたら、プレイは正常に実行したと判断できます。他の項目がカウントされていたら、何らかのエラーが発生した、もしくはエラーが発生したがリカバリーしたことを示しています。
