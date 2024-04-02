document.addEventListener('DOMContentLoaded', function() {
  // 販売価格の入力フィールドを取得
  const priceInput = document.getElementById('item-price');

  // 販売手数料と販売利益を表示する要素を取得
  const addTaxPrice = document.getElementById('add-tax-price');
  const profit = document.getElementById('profit');

  // 販売価格の変更時に計算を行うイベントリスナーを追加
  priceInput.addEventListener('input', function() {
    // 販売価格を取得
    const price = parseInt(priceInput.value);

    // 販売手数料を計算（10%と仮定）
    const tax = Math.floor(price * 0.1);
    // 販売利益を計算
    const earnings = price - tax;

    // 計算結果を表示
    addTaxPrice.textContent = tax.toLocaleString(); // 販売手数料を表示（カンマ区切り）
    profit.textContent = earnings.toLocaleString(); // 販売利益を表示（カンマ区切り）
  });
});