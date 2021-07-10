.. _awx-playbook-gitlab-key:

##################################################
GitLab サーバーに公開鍵を登録
##################################################
GitLab サーバーに作成した公開鍵を登録します。

#. GitLab サーバーにサインイン

   .. image:: img/2021-07-10_14h17_59.png
      :scale: 70%

#. 名前のアイコンをクリック

   .. image:: img/2021-07-10_14h18_11.png

#. :guilabel:`Edit profile` をクリック

   .. image:: img/2021-07-10_14h18_19.png

#. :guilabel:`SSH Keys` をクリック

   .. image:: img/2021-07-10_14h18_31.png

#. 「 Key 」欄に公開鍵（ :file:`id_ed25519.pub` ）の内容を貼り付け

   .. image:: img/2021-07-10_14h19_17.png
      :scale: 70%

   ↓

   .. image:: img/2021-07-10_14h19_39.png
      :scale: 70%

#. 「 Title 」に鍵のタイトルを入力

   .. image:: img/2021-07-10_14h19_52.png
      :scale: 70%

#. :guilabel:`Add key` をクリック

   .. image:: img/2021-07-10_14h19_56.png
      :scale: 70%

#. 公開鍵の登録終了

   .. image:: img/2021-07-10_14h20_02.png
      :scale: 70%
