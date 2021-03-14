// function comment() {

//   const submit = document.getElementById("submit");
//   submit.addEventListener("click", (e) => {

//     debugger

//     const XHR = new XMLHttpRequest();
//     const formData = new FormData(document.getElementById("comment_form"));

//     XHR.open("POST", url: '/posts/this.id/comment', true);
//     XHR.responseType = "json";
//     XHR.send(formData);

//     XHR.onload = () => {
//       if (XHR.status != 200) {
//         alert(`Error ${XHR.status}: ${XHR.statusText}`);
//         return null;
//       }
//       const comment = XHR.response.comment;
//       const list = document.getElementById("comments_list");
//       const formText = document.getElementById("comment");
//       const HTML = `
//         <div class="content_comment" id="comments_list">
//           <span class="content_comment_nickname">Nickname:${comment.user.nickname}さん</span>
//           <span class="content_comment_content">${comment.comment}</span>
//         </div>`
//       list.insertAdjacentHTML("afterend", HTML);
//       formText.value = "";
//     };
//     e.preventDefault();
//   });
// }

// window.addEventListener("load", comment);