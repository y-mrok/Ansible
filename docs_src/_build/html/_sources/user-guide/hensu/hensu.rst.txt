.. _hensu:

##################################################
変数
##################################################
- 一時的に値を記憶しておくための変数を定義・使用できる
- 変数は定義する場所により名称が異なる（例：ホスト変数、グループ変数）
- 変数は定義する場所によりスコープ（適用範囲＝参照できる場所）が異なる
- 変数名は「英字」、「数字」、「アンダースコア ``_`` 」の組み合わせ
- `Python のキーワード <https://docs.python.org/3/reference/lexical_analysis.html#keywords>`_ と `playbook のキーワード <https://docs.ansible.com/ansible/latest/reference_appendices/playbooks_keywords.html#playbook-keywords>`_ は変数名に使用できない

.. toctree::
   :maxdepth: 2

   ./hensu-no-syurui
   ./play-hensu
   ./magic-hensu
   ./fact-hensu
   ./task-hensu
   ./hensu-no-sansho
