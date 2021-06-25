.. _handlers:

##################################################
handlers
##################################################
- tasks セクション内のタスクを実行した結果、管理対象ノードが変更（ = 実行結果が changed ）されたとき、 handleres セクション内のタスクを実行する
- tasks セクション内のタスクに設定した ``notify`` ディレクティブに指定したハンドラー名と handlers セクション内のタスクに設定した ``listen`` ディレクティブに指定したハンドラー名で関係付ける
- tasks セクション内のすべてのタスクの実行後に handlers セクション内のタスクを実行する

.. toctree::
   :maxdepth: 2

   ./handlers-kihondousa
   ./handlers-fukusu
   ./handlers-tochu
