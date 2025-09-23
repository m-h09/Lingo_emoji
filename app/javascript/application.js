console.log("✅ application.js loaded");
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

//クリアボタン処理
document.addEventListener("DOMContentLoaded", () => {
  const clearBtn   = document.getElementById("clear-btn");
  const textArea   = document.querySelector("textarea[name='base_prompt']");
  const outputDiv  = document.getElementById("txt-body");

  if (clearBtn) {
    clearBtn.addEventListener("click", () => {
      if (textArea) textArea.value = "";        // 入力欄を空にする
      if (outputDiv) outputDiv.textContent = ""; // 出力結果も空にする
    });
  }
});

// リロード時だけリセット
// リロード時だけリセット（新しい書き方）
window.addEventListener("load", () => {
  const [navEntry] = performance.getEntriesByType("navigation");
  if (navEntry && navEntry.type === "reload") {
    const textArea = document.querySelector("textarea[name='base_prompt']");
    const outputDiv = document.getElementById("txt-body");
    if (textArea) textArea.value = ""; // 入力欄を空にする
    if (outputDiv) outputDiv.textContent = ""; // 出力結果も空にする
  }
});

// 戻る/進む など BFCache 復元時もリセット
window.addEventListener("pageshow", (event) => {
  if (event.persisted) {
    const textArea = document.querySelector("textarea[name='base_prompt']");
    const outputDiv = document.getElementById("txt-body");
    if (textArea) textArea.value = "";
    if (outputDiv) outputDiv.textContent = "";
  }
});
// セレクトメニューの値によってラジオボタンの表示/非表示を切り替え

document.addEventListener("DOMContentLoaded", () => {


  const emojiSelect = document.getElementById("emoji-select");
  const radioGroup = document.getElementById("emoji-radio-group");

  if (!emojiSelect || !radioGroup) return;

  function toggleRadioGroup() {
    console.log("切り替え実行, 現在の値:", emojiSelect.value);
    if (emojiSelect.value === "kansai") {
      radioGroup.style.display = "none";  // 非表示
    } else {
      radioGroup.style.display = "flex";  // 表示
    }
  }

  toggleRadioGroup(); // 初期表示
  emojiSelect.addEventListener("change", toggleRadioGroup); // 変更時
});
