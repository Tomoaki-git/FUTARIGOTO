function good() {
  // goodボタンのがクリックされた際に表示を変更する
  const good_btn = document.getElementById('heart')

  good_btn.addEventListener('click', () => {
    if (good_btn.src === 'http://localhost:3000/assets/good-btn.jpg'){
      good_btn.src = '/assets/good-btn-clicked.jpg'
    } else {
      good_btn.src = '/assets/good-btn.jpg'
    }
  })
};

window.addEventListener('load', good)