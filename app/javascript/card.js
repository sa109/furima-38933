const pay = () => {
  const payjp = Payjp()// PAY.JPテスト公開鍵
  const elements = payjp.elements();
  const numberElement = elements.create('cardNumber');
  const expiryElement = elements.create('cardExpiry');
  const cvcElement = elements.create('cardCvc');
  numberElement.mount('#number-form');
  expiryElement.mount('#expiry-form');
  cvcElement.mount('#cvc-form');

  const submit = document.getElementById("button");

  submit.addEventListener("click", (e) => {
    // submitボタンをクリックすることで起こる標準設定されているイベントを阻止
    e.preventDefault();
    payjp.createToken(numberElement).then(function (response) {
      if (response.error) {
      } else {
        const token = response.id;
        const renderDom = document.getElementById("cdarhge-form");
        const tokenObj = `<input value=${token} name='token' type="hidden">`;
        renderDom.insertAdjacentHTML("beforeend", tokenObj);
      }
      numberElement.clear();
      expiryElement.clear();
      cvcElement.clear();
      document.getElementById("chage-form").submit();
    });
  });
}:

window.addEventListener("load", pay);