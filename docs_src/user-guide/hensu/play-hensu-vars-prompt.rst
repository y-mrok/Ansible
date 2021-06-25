.. _play-hensu-vars-prompt:

##################################################
vars_prompt ディレクティブ
##################################################
- 対話式で変数に値を設定する
- 値はプレイの最初に 1 回だけ設定する（タスクのように実行対象の管理対象ノードの数だけ実行するわけではない）

.. _play-hensu-vars-prompt-kobun:

**************************************************
構文
**************************************************
.. code-block:: none

   vars_prompt: 
     - name: 変数名
       prompt: 入力プロンプト
       private: yes | no
       encrypt: 暗号化形式
       confirm: yes | no
   
   ※yes | no
     yes または no を設定する

.. list-table::
   :widths: 1, 6
   :header-rows: 1

   * - パラメーター
     - 意味
   * - name
     - | ・入力した値を設定する変数
       | ・ prompt パラメーターを省略したときは変数名が入力プロンプトを兼ねる
   * - prompt
     - 入力時に表示するプロンプト（文字列）
   * - private
     - | 入力した文字列を画面に表示するか否か
       | ・yes：表示しない（デフォルト）
       | ・no ：表示する
   * - encrypt
     - | 入力した文字列を暗号化するときの形式（ハッシュ化のアルゴリズム）
       | ・sha512_crypt
       | ・sha256_crypt
       | ・md5_crypt
   * - confirm
     - | 入力した文字列を再度入力するか否か（入力確認）
       | ・yes：再度入力する
       | ・no ：再度入力しない（デフォルト）

.. _play-hensu-vars-prompt-rei:

**************************************************
使用例
**************************************************
- name パラメーターだけ指定

.. literalinclude:: ./yaml/sample.yml
   :language: yaml

.. code-block:: none

   piyo@vmpc:~/example/ex5$ ansible-playbook -i hosts.yml sample.yml 
   input_value: 
   
   PLAY [Example of a vars section] *********************************************************************************************************************
   
   TASK [入力した値を確認] **************************************************************************************************************************************
   ok: [server1] => {
       "input_value": "abc"
   }
   
   PLAY RECAP *******************************************************************************************************************************************
   server1                    : ok=1    changed=0    unreachable=0    failed=0    skipped=0    rescued=0    ignored=0   
   
   piyo@vmpc:~/example/ex5$

- 入力プロンプトを表示

.. literalinclude:: ./yaml/sample2.yml
   :language: yaml

.. code-block:: none

   piyo@vmpc:~/example/ex5$ ansible-playbook -i hosts.yml sample.yml 
   値を入力してください: 
   
   PLAY [Example of a vars section] *********************************************************************************************************************
   
   TASK [入力した値を確認] **************************************************************************************************************************************
   ok: [server1] => {
       "input_value": "abc"
   }
   
   PLAY RECAP *******************************************************************************************************************************************
   server1                    : ok=1    changed=0    unreachable=0    failed=0    skipped=0    rescued=0    ignored=0   
   
   piyo@vmpc:~/example/ex5$ 

- 入力した文字を画面に表示

.. literalinclude:: ./yaml/sample3.yml
   :language: yaml

.. code-block:: none

   piyo@vmpc:~/example/ex5$ ansible-playbook -i hosts.yml sample.yml 
   値を入力してください: abc
   
   PLAY [Example of a vars section] *********************************************************************************************************************
   
   TASK [入力した値を確認] **************************************************************************************************************************************
   ok: [server1] => {
       "input_value": "abc"
   }
   
   PLAY RECAP *******************************************************************************************************************************************
   server1                    : ok=1    changed=0    unreachable=0    failed=0    skipped=0    rescued=0    ignored=0   
   
   piyo@vmpc:~/example/ex5$ 

- 入力確認

.. literalinclude:: ./yaml/sample4.yml
   :language: yaml

.. code-block:: none

   piyo@vmpc:~/example/ex5$ ansible-playbook -i hosts.yml sample.yml 
   値を入力してください: abc
   confirm 値を入力してください: xyz
   ***** VALUES ENTERED DO NOT MATCH ****
   値を入力してください: abc
   confirm 値を入力してください: abc
   
   PLAY [Example of a vars section] *********************************************************************************************************************
   
   TASK [入力した値を確認] **************************************************************************************************************************************
   ok: [server1] => {
       "input_value": "abc"
   }
   
   PLAY RECAP *******************************************************************************************************************************************
   server1                    : ok=1    changed=0    unreachable=0    failed=0    skipped=0    rescued=0    ignored=0   
   
   piyo@vmpc:~/example/ex5$ 

- 入力した文字列をハッシュ化

.. literalinclude:: ./yaml/sample5.yml
   :language: yaml

.. code-block:: none

   piyo@vmpc:~/example/ex5$ ansible-playbook -i hosts.yml sample.yml 
   値を入力してください: abc
   
   PLAY [Example of a vars section] *********************************************************************************************************************
   
   TASK [入力した値を確認] **************************************************************************************************************************************
   ok: [server1] => {
       "input_value": "$6$WzT/p0.XKPBffCqC$mohBLPpYjTHIUWTDeNDUYvrhbkTbVyXMSB.z.8Grg0yBaf9YOpcaQiDEqEw5XE5p2ccJuOBVKRyDXEFEJ4EeD1"
   }
   
   PLAY RECAP *******************************************************************************************************************************************
   server1                    : ok=1    changed=0    unreachable=0    failed=0    skipped=0    rescued=0    ignored=0   
   
   piyo@vmpc:~/example/ex5$ 
