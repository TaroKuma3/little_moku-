
function getJustNowDatas() {
  $.ajax({
      type: 'get',
      url: '/ajax/justnow.json'
  }).done(function (response, status) {

      $('#justNowUl').empty() //justNowUlの中身を空っぽに

      const mokus = response //responseは↑の第一引数。ブラウザから返ってきたデーター
      console.log(mokus)

      for (let i = 0; i < mokus.length; i++) { //変数iを定義　mokusの要素の数より小さいうちはインクリメント
          const moku = mokus[i] //定数mokuを定義　mokusに入っている要素のi番目を取得
          console.log(moku.id, moku.moku_type_id)
          // let created_time = moment(moku.created_at).fromNow()
          const liElement = "<li>" + moku.created_at + "   " + moku.user.name + "さんが" + moku.moku_type.name + "でMOKUを開始しました！" + "</li>" //定数liElementを定義　moku.idをリスト形式で出力
          $('#justNowUl').append(liElement) //justNowUlに対してliElementを追加　
      }
  })
}

$(document).ready(function () {
  setInterval(getJustNowDatas, 5000)
  // $('#justNowButton').on('click', function () {
  // })

})

