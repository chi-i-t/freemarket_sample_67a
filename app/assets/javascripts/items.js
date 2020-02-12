$(document).on('turbolinks:load', ()=> {

  // ------------------画像用のinputを生成する関数----------------------------
  const buildFileField = (index)=> {
    const html = `<div data-index="${index}" class="js-file_group">
                    <input class="js-file" type="file"
                    name="item[images_attributes][${index}][src]"
                    id="item_images_attributes_${index}_src"><br>
                    <div class="js-remove">削除</div>
                  </div>`;
    return html;
  }
  // ----------------------------------------------------------------------

  // file_fieldのnameに動的なindexをつける為の配列
  let fileIndex = [1,2,3,4,5,6,7,8,9,10];


  // id名 image-boxを取得し、.js-fileクラスがchange(変更)されたら発火する
  $('#image-box').on('change', '.js-file', function(e) {
    // fileIndexの先頭の数字を使ってinputを作る.配列の先頭の数字をbuildFileField関数に渡す。
    // image-boxのところに、buildFileFieldで生成したHTMLをappend(追加)する。
    $('#image-box').append(buildFileField(fileIndex[0]));
    fileIndex.shift(); //shift : 先頭を削除
    // 末尾の数に1足した数を追加する
    fileIndex.push(fileIndex[fileIndex.length - 1] + 1)
  });

  $('#image-box').on('click', '.js-remove', function() {
    $(this).parent().remove();
    // 画像入力欄が0個にならないようにしておく
    if ($('.js-file').length == 0) $('#image-box').append(buildFileField(fileIndex[0]));
  });
});