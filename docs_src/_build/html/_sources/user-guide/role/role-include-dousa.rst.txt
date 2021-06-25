.. _role-include-dousa:

##################################################
ansible.builtin.include_role の動作
##################################################
ディレクティブを併用して ``ansible.builtin.include_role`` モジュールの動作を確認します。

.. _role-include-dousa-directive:

**************************************************
ロールの実行とディレクティブ
**************************************************
ディレクトリ構造です。

.. literalinclude:: ./log/directory5.log
   :language: none

インベントリの内容です。

.. literalinclude:: ./yaml/hosts2.yml
   :language: yaml

ロールの内容です。

- defaults/main.yml

   .. literalinclude:: ./yaml/roles/basic_webserver_configuration2/defaults/main.yml
      :language: yaml

- files/

   .. literalinclude:: ./log/directory5.log
      :language: none
      :emphasize-lines: 7-8

- tasks/main.yml

   .. literalinclude:: ./yaml/roles/basic_webserver_configuration2/tasks/main.yml
      :language: yaml

- handlers/main.yml

   .. literalinclude:: ./yaml/roles/basic_webserver_configuration2/handlers/main.yml
      :language: yaml

``ansible.builtin.include_role`` モジュールを使用したプレイです。

.. literalinclude:: ./yaml/webservers4.yml
   :language: yaml
   :emphasize-lines: 7-10

実行ログです。 ``ansible.builtin.include_role`` モジュールに ``become`` ディレクティブは設定できないのでエラーになりました。

.. literalinclude:: ./log/webservers4.log
   :language: none
   :emphasize-lines: 2

プレイから ``become`` ディレクティブを削除しました。

.. literalinclude:: ./yaml/webservers5.yml
   :language: yaml

``block`` ディレクティブを使用して :file:`tasks/main.yml` 内のすべてのタスクに ``become`` ディレクティブを設定しました。

.. literalinclude:: ./yaml/tasks3.yml
   :language: yaml

実行ログです。今度は最後まで実行できました。

.. literalinclude:: ./log/webservers5.log
   :language: none
   :emphasize-lines: 2

``ansible.builtin.include_role`` モジュールの実行部分を含む実行ログの一部です。

.. code-block:: none

   TASK [Web server construction roles.] ****************************************************************************************************************
   skipping: [ubuntu2004]

   TASK [basic_webserver_configuration2 : Install the latest version of the httpd package.] *************************************************************
   changed: [centos83]

``ansible.builtin.include_role`` モジュールに設定したディレクティブはモジュール自体に適用されます。ロール内のタスクに継承されません。今回 ``ansible.builtin.include_role`` モジュールに設定した ``when`` ディレクティブで管理対象ノード ubuntu2004 を skipping したので、ロール内に 管理対象ノード ubuntu2004 の実行に関するログは出力されません。ロールの実行は ``when`` ディレクティブで skipping されなかった管理対象ノード centos83 だけです。

.. _role-include-dousa-error:

**************************************************
ロール内のエラー
**************************************************
:file:`tasks/main.yml` 内の一部を存在しないモジュール名に変更しました。

.. literalinclude:: ./yaml/tasks4.yml
   :language: yaml
   :emphasize-lines: 5

実行ログです。ロールの実行に入ったタイミングでエラーを検出しました。

.. literalinclude:: ./log/webservers5-1.log
   :language: none
   :emphasize-lines: 11

.. _role-include-dousa-loop:

**************************************************
loop ディレクティブ
**************************************************
ディレクトリ構造です。

.. literalinclude:: ./log/directory6.log
   :language: none

ロールの内容です。

- tasks/main.yml

   .. literalinclude:: ./yaml/roles/loop-test/tasks/main.yml
      :language: yaml

プレイの内容です。

.. literalinclude:: ./yaml/roles3.yml
   :language: yaml
   :emphasize-lines: 9-12

実行ログです。ロール全体が繰り返し実行されました。

.. literalinclude:: ./log/role3.log
   :language: none

ロールの中で ``loop`` ディレクティブを使用した :file:`tasks/main.yml` です。

.. literalinclude:: ./yaml/roles/loop-test3/tasks/main.yml
   :language: yaml

実行ログです。 ``ansible.builtin.include_role`` モジュールに設定した ``loop`` ディレクティブのループ変数 item が ロール内のタスクに設定した ``loop`` ディレクティブのループ変数 item で上書きされました。

.. literalinclude:: ./log/role4.log
   :language: none

ループ変数 item の衝突が発生したので :ref:`loop_var ディレクティブを使用してループ変数を使用する <loop-control-loop-var>` よう警告メッセージが表示されました。

.. code-block:: none

   [WARNING]: The loop variable 'item' is already in use. You should set the `loop_var` value in the `loop_control` option for the task to something
   else to avoid variable collisions and unexpected behavior.

ロールの中で ``loop_var`` ディレクティブを使用した :file:`tasks/main.yml` です。

.. literalinclude:: ./yaml/tasks6.yml
   :language: yaml
   :emphasize-lines: 9-10

実行ログです。今回は ``ansible.builtin.include_role`` モジュールとロール内のタスクに設定した ``loop`` ディレクティブのループ変数の値が参照できました。

.. literalinclude:: ./log/role5.log
   :language: none
