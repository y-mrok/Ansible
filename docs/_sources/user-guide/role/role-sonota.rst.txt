.. _role-sonota:

##################################################
その他
##################################################

.. _role-sonota-role-hensu:

**************************************************
ロール名に変数を指定する
**************************************************
``ansible.builtinin.include_role`` モジュールはロール名に変数を指定できます。

ディレクトリ構造です。

.. literalinclude:: ./log/directory7.log
   :language: none

インベントリの内容です。

.. literalinclude:: ./yaml/hosts2.yml
   :language: yaml

:file:`CentOS/tasks/main.yml` の内容です。

.. literalinclude:: ./yaml/roles/CentOS/tasks/main.yml
   :language: yaml

:file:`Ubuntu/tasks/main.yml` の内容です。

.. literalinclude:: ./yaml/roles/Ubuntu/tasks/main.yml
   :language: yaml

プレイの内容です。ロール名にファクト変数 ansible_facts['distribution'] を指定しています。

.. literalinclude:: ./yaml/roles5.yml
   :language: yaml
   :emphasize-lines: 8

実行ログです。ファクト変数 ansible_facts['distribution'] をロール名に置換して実行しました。

.. literalinclude:: ./log/role5-1.log
   :language: none
   :emphasize-lines: 11, 16

``ansible.builtinin.import_role`` モジュールでロール名に変数を指定するとエラーになります。

.. literalinclude:: ./yaml/roles6.yml
   :language: yaml

.. literalinclude:: ./log/role6.log
   :language: none
