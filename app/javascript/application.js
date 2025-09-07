// Configure your import map in config/importmap.rb. Read more: https://github.com/rails/importmap-rails
import "bootstrap"
(function () {
  function showToast() {
    const t = document.getElementById("copy-toast");
    if (!t) return;
    t.style.display = "block";
    setTimeout(() => (t.style.display = "none"), 1500);
  }

  function init() {
    const txt = document.getElementById("txt-body");
    const btn = document.getElementById("copy-btn");
    if (!txt || !btn) return;

    btn.addEventListener("click", async () => {
      try {
        // https or localhost なら isSecureContext は true
        if (!window.isSecureContext) throw new Error("insecure");
        await navigator.clipboard.writeText((txt.textContent || "").trim());
        showToast();
      } catch (e) {
        // 予期せぬ失敗だけ拾う（権限拒否など）
        console.error("copy failed:", e);
      }
    });
  }

  document.addEventListener("turbo:load", init);
  document.addEventListener("DOMContentLoaded", init);
})();

function initSelectToggle() {
  const selectToggle = document.getElementById("js_select-Toggle");
  if (selectToggle) {
    selectToggle.value ="";
    //セレクトメニューが変更されたら実行
    selectToggle.addEventListener('change', () => {
      //選択されたvalueを取得
      const toggleVal = selectToggle.value;
      document.querySelectorAll('.bl_selectCont').forEach(selectCont => {
        //各コンテンツのIDがtoggleValと一致するか確認して条件に応じてis_activeクラスを制御
        const isActive = selectCont.id === toggleVal;
        // isActiveがtrueならis_activeクラスを追加、falseなら削除
        selectCont.classList.toggle('is_active', isActive);
      });
    });
  }
}
document.addEventListener("turbo:load", initSelectToggle);
document.addEventListener("DOMContentLoaded", initSelectToggle);
