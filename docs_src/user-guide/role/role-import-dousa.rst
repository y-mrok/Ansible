.. _role-import-dousa:

##################################################
ansible.builtin.import_role の動作
##################################################
ディレクティブを併用して ``ansible.builtin.import_role`` モジュールの動作を確認します。

.. _role-import-dousa-directive:

**************************************************
ロールの実行とディレクティブ
**************************************************
ディレクトリ構造です。

.. literalinclude:: ./log/directory3.log
   :language: none

インベントリの内容です。

.. literalinclude:: ./yaml/hosts2.yml
   :language: yaml

ロールの内容です。

- defaults/main.yml

   .. literalinclude:: ./yaml/roles/basic_webserver_configuration2/defaults/main.yml
      :language: yaml

- files/

   .. literalinclude:: ./log/directory3.log
      :language: none
      :emphasize-lines: 7-8

- tasks/main.yml

   .. literalinclude:: ./yaml/roles/basic_webserver_configuration2/tasks/main.yml
      :language: yaml

- handlers/main.yml

   .. literalinclude:: ./yaml/roles/basic_webserver_configuration2/handlers/main.yml
      :language: yaml

``ansible.builtin.import_role`` モジュールを使用したプレイと実行ログです。

.. literalinclude:: ./yaml/webservers3.yml
   :language: yaml
   :emphasize-lines: 7-10

.. literalinclude:: ./log/webservers3.log
   :language: none

ロール内のタスクの一部とその実行ログです。

.. code-block:: yaml

   - name: Install the latest version of the httpd package.
     ansible.builtin.dnf:
       name: "{{ http_packages }}"
       state: latest
     notify:
       - Installed the httpd package

.. code-block:: none

   TASK [basic_webserver_configuration2 : Install the latest version of the httpd package.] *************************************************************
   skipping: [ubuntu2004]
   changed: [centos83]

``ansible.builtin.import_role`` モジュールに設定したディレクティブはロール内の各タスクに継承されます。すなわち、 ``ansible.builtin.import_role`` モジュールに設定した ``when`` ディレクティブと ``become`` ディレクティブはロール内の各タスクに継承されます。結果、管理対象ノード ubuntu2004 で ``ansible.builtin.dnf`` モジュールの実行は skipping になり、管理対象ノード centos83 でモジュールは正常に実行されました。

.. _role-import-dousa-error:

**************************************************
ロール内のエラー
**************************************************
:file:`tasks/main.yml` 内の一部を存在しないモジュール名に変更しました。

.. literalinclude:: ./yaml/tasks2.yml
   :language: yaml
   :emphasize-lines: 3

実行ログです。タスクを実行する前の段階でロール内のエラーを検出しました。

.. literalinclude:: ./log/webservers3-1.log
   :language: none
   :emphasize-lines: 2

.. _role-import-dousa-loop:

**************************************************
loop ディレクティブ
**************************************************
ディレクトリ構造です。

.. literalinclude:: ./log/directory4.log
   :language: none

ロールの内容です。

- tasks/main.yml

   .. literalinclude:: ./yaml/roles/loop-test/tasks/main.yml
      :language: yaml

プレイの内容です。

.. literalinclude:: ./yaml/roles1.yml
   :language: yaml
   :emphasize-lines: 9-12

実行ログです。 ``ansible.builtin.import_role`` モジュールに ``loop`` ディレクティブは設定できないのでエラーになりました。

.. literalinclude:: ./log/role1.log
   :language: none
   :emphasize-lines: 2

:file:`tasks/main.yml` 内で ``loop`` ディレクティブを使用するのは問題ありません。

.. literalinclude:: ./yaml/roles2.yml
   :language: yaml

:file:`tasks/main.yml`

.. literalinclude:: ./yaml/roles/loop-test2/tasks/main.yml
   :language: yaml

実行ログです。ロール内で ``loop`` ディレクティブを設定したタスクが実行されました。

.. literalinclude:: ./log/role2.log
   :language: none
   :emphasize-lines: 13-22
