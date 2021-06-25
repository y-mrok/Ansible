.. _play-hensu-vars-files:

##################################################
vars_files ディレクティブ
##################################################
- :ref:`vars <play-hensu-vars>` で定義する内容を別ファイル（変数のファイル）に切り出す
- 切り出したファイルを ``vars_files`` ディレクティブでプレイ内に取り込む

.. _play-hensu-vars-files-rei:

**************************************************
使用例
**************************************************
- vars セクション

.. code-block:: yaml

   vars_files:
     - vars/account.yml
     - vars/todofuken.yml

- vars/account.yml

.. code-block:: yaml

   ---
   user_account:
     - user_name: hanako-san
       user_password: hanako-no-password
       sudo_flg: yes
     - user_name: taro-san
       user_password: taro-no-password
       sudo_flg: no
     - user_name: jiro-san
       user_password: jiro-no-password
       sudo_flg: yes

- vars/todofuken.yml

.. code-block:: yaml

   ---
   Hokkaido:
     kubun: Hokkaido
     todofukencho: Sapporo
   Aomori:
     kubun: Tohoku
     todofukencho: Aomori
   Ibaraki:
     kubun: Kanto
     todofukencho: Mito

- 各ファイルの配置

.. code-block:: none

   .
   ├── hosts.yml
   ├── sample.yml
   └── vars
       ├── account.yml
       └── todofuken.yml

.. note::

   ``vars_files`` ディレティブで取り込む変数のファイルは他の YAML ファイルとの識別を容易にするため、特定のディレクトリ（上記の :file:`vars/` ディレクトリ）内に集めたほうがコードの可読性の向上に繋がります。
