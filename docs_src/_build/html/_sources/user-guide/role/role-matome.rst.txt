.. _role-matome:

##################################################
まとめ
##################################################
.. list-table:: 
   :header-rows: 1
   
   * - 
     - ansible.builtin.import_role
     - ansible.builtin.include_role
   * - ロールの構文チェックが行われるタイミング
     - プレイの実行前
     - ロールが読み込まれた時
   * - 指定したディレクティブ（ become / loop ディレクティブを除く）
     - ロール内の各タスクに継承（適用）される
     - ansible.builtin.include_role モジュールを使用したタスク自体に適用される
   * - become ディレクティブ
     - 指定できる
     - 指定できない
   * - loop ディレクティブ
     - 指定できない
     - 指定できる
   * - ロール名に変数を指定
     - できない
     - できる

.. note::

   ``ansible.builtin.import_role`` モジュールと ``ansible.builtin.include_role`` モジュールは同じロールを呼び出（実行）しても動作が異なります。コードの誤読などを避けるため、プレイ内は ``ansible.builtin.import_role`` モジュールを使用するのか ``ansible.builtin.include_role`` モジュールを使用するのか、統一することが望ましいです。
