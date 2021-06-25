.. _errorhandling:

##################################################
エラー処理
##################################################
Ansible は次の場合にエラーが発生したと判断します。

- タスクの実行が失敗したとき
- コマンドの実行でリターンコード（ rc : return code , 戻り値）がゼロ以外のとき

エラーが発生した場合、エラーが発生したタスクを実行した管理対象ノード上で以降のタスクの実行を中断します。エラーが発生しなかった管理対象ノードはタスクの実行を継続します。

``ansible.builtin.command`` コマンドや ``ansible.builtin.shell`` コマンドでコマンドを実行した場合、リターンコードがゼロ以外で問題ない場合があります。この様なときにエラー処理を使用します。 Ansible は 2 種類のエラー処理を用意しています。

- 発生したエラーを無視する
- エラーと判断する状態を定義する

.. note::

   ブロックのエラー処理は ``rescure`` ディレクティブを使用した「 :ref:`block-rescue` 」を参照ください。

.. toctree::
   :maxdepth: 2

   ./errorhandling-ignore
   ./errorhandling-register-hensu
   ./errorhandling-teigi
   ./errorhandling-sonota
