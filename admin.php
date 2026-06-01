<?php
session_start();
include 'connect/connection.php';

// ดึงข้อมูลเมนูทั้งหมดเพื่อแสดงในสต็อก
$sql = "SELECT * FROM menu ORDER BY id ASC";
$result = $conn->query($sql);
?>

<!DOCTYPE html>
<html lang="th">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>จัดการสต็อกสินค้า</title>
    <link rel="stylesheet" href="stylesheet.css">
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.4.2/css/all.min.css">
    <script>
        function changeStock(menuId, action) {
            const amountInput = document.getElementById(`amount_${menuId}`);
            const amount = parseInt(amountInput.value) || 1;

            if (amount <= 0) {
                alert('กรุณาใส่จำนวนที่มากกว่า 0');
                return;
            }

            const formData = new FormData();
            formData.append('menu_id', menuId);
            formData.append('action', action);
            formData.append('amount', amount);

            fetch('update_stock.php', {
                method: 'POST',
                body: formData
            })
            .then(response => response.json())
            .then(data => {
                if (data.success) {
                    document.getElementById(`stock_display_${menuId}`).innerText = data.new_stock;
                    amountInput.value = 1; // รีเซ็ตจำนวนเป็น 1
                    alert('อัปเดตสต็อกสำเร็จ!');
                } else {
                    alert('เกิดข้อผิดพลาด: ' + data.message);
                }
            })
            .catch(error => {
                console.error('Error:', error);
                alert('เกิดข้อผิดพลาดในการเชื่อมต่อ');
            });
        }
    </script>
</head>
<body>
    <div class="container">
        <nav class="navbar">
            <div class="logo">
                <a href="#"><img src="pic/logo.png" alt="logo"></a>
            </div>
            <ul class="menu">
                <li><a href="admin.php" class="active">Stock</a></li>
                <li><a href="admin_conf.php" class="">Order</a></li>
                <li><a href="admin_transaction.php" class="">Transaction</a></li>
            </ul>
        </nav>
    </div>

    <div class="cart-container">
        <h2>จัดการสต็อกสินค้า (Stock Management)</h2>
        <?php if ($result->num_rows > 0) { ?>
            <table>
                <thead>
                    <tr>
                        <th>รหัสเมนู</th>
                        <th>รูปภาพ</th>
                        <th>ชื่อเมนู</th>
                        <th>ราคา</th>
                        <th>สต็อกปัจจุบัน</th>
                        <th>จัดการสต็อก</th>
                    </tr>
                </thead>
                <tbody>
                    <?php while ($row = $result->fetch_assoc()) { ?>
                        <tr>
                            <td><?php echo $row['id']; ?></td>
                            <td><img src="pic/<?php echo htmlspecialchars($row['image']); ?>" alt="<?php echo htmlspecialchars($row['name']); ?>" width="80" style="border-radius: 8px;"></td>
                            <td><?php echo htmlspecialchars($row['name']); ?></td>
                            <td><?php echo number_format($row['price'], 2); ?> บาท</td>
                            <td><strong id="stock_display_<?php echo $row['id']; ?>"><?php echo $row['stock']; ?></strong> ชิ้น</td>
                            <td>
                                <div style="display: flex; justify-content: center; align-items: center; gap: 5px;">
                                    <input type="number" id="amount_<?php echo $row['id']; ?>" value="1" min="1" style="width: 60px; padding: 5px; text-align: center;">
                                    <button onclick="changeStock(<?php echo $row['id']; ?>, 'increase')" style="background-color: #28a745; color: white; border: none; padding: 6px 12px; cursor: pointer; border-radius: 4px; font-weight: bold;">+</button>
                                    <button onclick="changeStock(<?php echo $row['id']; ?>, 'decrease')" style="background-color: #dc3545; color: white; border: none; padding: 6px 12px; cursor: pointer; border-radius: 4px; font-weight: bold;">-</button>
                                </div>
                            </td>
                        </tr>
                    <?php } ?>
                </tbody>
            </table>
        <?php } else { ?>
            <p>ไม่มีรายการอาหารในระบบ</p>
        <?php } ?>
    </div>
</body>
</html>