.. _playbook-no-kosei:

##################################################
プレイブックの構成
##################################################
- プレイブックは 1 つ以上のプレイで構成される
- プレイブック内のプレイは記述した順に実行する
- プレイブックを記述したファイルがプレイブックファイル

プレイブックの構成です。

.. image:: img/playbook.png

YAML で表現すると次のようになります。各プレイの最初は ``name`` ディレクティブでプレイ名を設定します。

.. code-block:: none

   ---
   - name: Building a Web Server
   　　　　　・
   　　　　　・
   　　　　　・
   　　1 つめのプレイの内容
   　　　　　・
   　　　　　・
   　　　　　・
   
   - name: Maintaining Data on the LDAP
   　　　　　・
   　　　　　・
   　　　　　・
   　　2 つめのプレイの内容
   　　　　　・
   　　　　　・
   　　　　　・
   
   - name: Change network configuration 
   　　　　　・
   　　　　　・
   　　　　　・
   　　3 つめのプレイの内容
   　　　　　・
   　　　　　・
   　　　　　・

プレイは記述した順に実行します。上記の例では「 Building a Web Server 」、「 Maintaining Data on the LDAP 」、「 Change network configuration 」の順に実行します。
