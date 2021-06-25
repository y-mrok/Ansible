.. _handlers-tochu:

##################################################
handlers の実行タイミングの変更
##################################################
- ``ansible.builtin.meta`` モジュールを使用して tasks セクションの途中でハンドラーを実行する

通常、ハンドラーは tasks セクションの全タスクの実行後が終了した後で実行します。 tasks セクション内で :command:`ansible.builtin.meta: flush_handlers` を実行すると、次の 2 点を実施します。

- :command:`ansible.builtin.meta: flush_handlers` の実行前までのタスクの ``notify`` ディレクティブに関連付けされたハンドラーを実行
- ハンドラーに関する情報をリセット

.. literalinclude:: ./yaml/handlers3.yml
   :language: yaml
   :emphasize-lines: 23-24

実行ログです。

.. literalinclude:: ./log/handlers3.log
   :language: none
   :linenos:
   :emphasize-lines: 14-15, 17-18, 26-27, 29-30, 32-33 

tasks セクションの途中で実行した 14 - 15 行目と 17 - 18 行目のハンドラーは :command:`ansible.builtin.meta: flush_handlers` を実行した結果です。ここで実行しているハンドラーはタスク [Install the latest version of Apache or update to the latest version] と [Update the configuration file -> Set the host name] の ``notify`` ディレクティブによるものです。:command:`ansible.builtin.meta: flush_handlers` を実行したあとはハンドラーに関する情報をリセットします。

tasks セクションのすべてのタスクの実行終了後に実行した 26 - 27 行目、 29 - 30 行目、 32 - 33 行目のハンドラーはタスク [Update the configuration file -> Set the listen port] と  [Open port:8080/tcp] の ``notify`` ディレクティブによるものです。タスク [Install the latest version of Apache or update to the latest version] と [Update the configuration file -> Set the host name] の ``notify`` ディレクティブに関連するハンドラーは :command:`ansible.builtin.meta: flush_handlers` で実行済みのため、ここでは関係ありません。

参考までに :command:`ansible.builtin.meta: flush_handlers` を削除した場合の実行ログです。こちらは tasks セクションのすべてのタスクの実行終了後にハンドラーを実行しています。

.. literalinclude:: ./log/handlers2.log
   :language: none
   :emphasize-lines: 20-21, 23-24, 26-27
