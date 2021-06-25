.. _ansible-lint:

##################################################
ansible-lint コマンド
##################################################

.. _ansible-lint-kobun:

**************************************************
構文
**************************************************
:command:`ansible-lint -h` の表示内容です。

.. literalinclude:: ./log/lint-2.log
   :language: none

.. _ansible-lint-default-rules:

**************************************************
デフォルトルール
**************************************************
.. literalinclude:: ./log/lint-3.log
   :language: none

.. _ansible-lint-jikko:

**************************************************
プレイブックをチェック
**************************************************
チェック対象のプレイブックファイルです。

.. literalinclude:: ./yaml/apache.yml
   :language: yaml

チェックした結果です。

.. literalinclude:: ./log/lint-4.log
   :language: none

2 点指摘されました。 1 点めです。

.. code-block:: none

   package-latest: Package installs should not use latest
   apache.yml:7 Task/Handler: Install Apache

「 :ref:`ansible-lint-default-rules` 」を参照すると次のように説明されています。

.. code-block:: none

   Package installs should use state=present with or without a version 

「パッケージのインストールでは、バージョンの有無にかかわらず、state=presentを使用します。」ということなので ``state`` パラメーターに指定する値は ``latest`` ではなく ``present`` に変更します。

2 点めです。

.. code-block:: none

   risky-file-permissions: File permissions unset or incorrect
   apache.yml:16 Task/Handler: copy index.html

「 :ref:`ansible-lint-default-rules` 」を参照すると次のように説明されています。

.. code-block:: none

   Missing or unsupported mode parameter can cause unexpected file      
   permissions based on version of Ansible being used. Be explicit,     
   like mode: 0644 to avoid hitting this rule. Special preserve value   
   is accepted only by copy, template modules. See                      
   https://github.com/ansible/ansible/issues/71200 

「 modeパラメータがない、またはサポートされていないと、使用している Ansible のバージョンに応じて予期しないファイルパーミッションが発生する可能性があります。mode のように明示してください。0644 のように明示的にして、このルールに当たらないようにします。特別な preserve 値は、copy や template モジュールでのみ受け入れられます。"https://github.com/ansible/ansible/issues/71200 "を参照してください。」ということなので ``mode`` パラメーターでパーミッションを指定します。

指摘された点を修正したプレイです。

.. literalinclude:: ./yaml/apache2.yml
   :language: yaml
   :emphasize-lines: 10,20

チェックした結果です。指摘された点を修正したので、指摘はありません。

.. literalinclude:: ./log/lint-5.log
   :language: none
