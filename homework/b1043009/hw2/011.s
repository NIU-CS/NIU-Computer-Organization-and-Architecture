# MIPS 泡沫排序 (Bubble Sort) 程式碼

.data
array:  .word  5, 3, 2, 4, 1 # 宣告陣列
size:   .word  5                    # 陣列的大小

.text
.globl main

# 主函數
main:
    la $a0, array                   # 將陣列地址加載到 $a0
    lw $a1, size                    # 將陣列大小加載到 $a1
    jal sort                        # 使用sort函數進行排序

    # 打印排序後的數組
    la $a0, array                   # 重新加載陣列地址到 $a0
    lw $a1, size                    # 重新加載陣列大小到 $a1
    li $t0, 0                       # 初始化索引

    # 結束程序
    li $v0, 10                      # syscall 代碼 10：退出
    syscall                         # 執行退出

# sort 函數 - 對整數數組進行排序
# 參數: $a0 - 數組的地址, $a1 - 數組的長度
sort:
    addi $sp, $sp, -24             # 分配堆疊空間
    sw $ra, 20($sp)                # 保存返回地址
    sw $s0, 16($sp)                # 保存 $s0 (數組地址)
    sw $s1, 12($sp)                # 保存 $s1 (數組長度)
    sw $s2, 8($sp)                 # 保存 $s2 (外層迴圈的計數器)
    sw $s3, 4($sp)                 # 保存 $s3 (內層迴圈的計數器)
    sw $s4, 0($sp)                 # 保存 $s4 (臨時變量)

    move $s0, $a0                  # 將陣列地址存儲到 $s0
    move $s1, $a1                  # 將陣列長度存儲到 $s1
    addi $s1, $s1, -1              # 長度減少一

outer_loop:
    li $s2, 0                      # 初始化外層迴圈計數器
    blt $s2, $s1, end_sort         # 如果計數器 >= 長度 - 1, 跳到結束

inner_loop:
    add $s3, $s0, $s2              # 計算當前元素的地址
    lw $t0, 0($s3)                 # 加載當前元素
    lw $t1, 4($s3)                 # 加載下一個元素
    ble $t0, $t1, continue         # 如果當前元素 <= 下一個元素就會繼續

    # 呼叫 swap 函數交換元素
    move $a0, $s3                  # 設置 swap 的第一個參數 (當前元素的地址)
    addi $a1, $s3, 4               # 設置 swap 的第二個參數 (下一個元素的地址)
    jal swap                       # 改使用swap 函數

continue:
    addi $s2, $s2, 1               # 外層迴圈計數器 +1
    j inner_loop                   # 跳轉到內層迴圈的開始

end_sort:
    lw $ra, 20($sp)                # 恢復返回地址
    lw $s0, 16($sp)                # 把用完的空間還回去 $s0
    lw $s1, 12($sp)                # 把用完的空間還回去 $s1
    lw $s2, 8($sp)                 # 把用完的空間還回去 $s2
    lw $s3, 4($sp)                 # 把用完的空間還回去 $s3
    lw $s4, 0($sp)                 # 把用完的空間還回去 $s4
    addi $sp, $sp, 24              # 釋放堆疊空間
    jr $ra                         # 返回到呼叫者

# swap 函數 - 交換兩個整數的值
# 參數: $a0 - 第一個整數的地址, $a1 - 第二個整數的地址
swap:
    lw $t0, 0($a0)                 # 讀取第一個整數的值
    lw $t1, 0($a1)                 # 讀取第二個整數的值
    sw $t0, 0($a1)                 # 將第一個整數的值寫入第二個整數的位置
    sw $t1, 0($a0)                 # 將第二個整數的值寫入第一個整數的位置
    jr $ra                         # 返回到呼叫者
