console.log("application.js loaded")
console.log("application.js START");
console.log("✅ application.js loaded");

//-----------------------------------------
// 出力結果表示
//-----------------------------------------
function initSelectToggle() {
  const selectToggle = document.getElementById("js_select-Toggle");
  if (selectToggle) {
    selectToggle.value = "";
    selectToggle.addEventListener('change', () => {
      const toggleVal = selectToggle.value;
      document.querySelectorAll('.bl_selectCont').forEach(selectCont => {
        const isActive = selectCont.id === toggleVal;
        selectCont.classList.toggle('is_active', isActive);
      });
    });
  }
}
document.addEventListener("turbo:load", initSelectToggle);
document.addEventListener("DOMContentLoaded", initSelectToggle);


//-----------------------------------------
// クリアボタン
//-----------------------------------------
document.addEventListener("DOMContentLoaded", () => {
  const clearBtn = document.getElementById("clear-btn");
  const textArea = document.querySelector("textarea[name='base_prompt']");
  const outputDiv = document.getElementById("txt-body");

  if (clearBtn) {
    clearBtn.addEventListener("click", () => {
      if (textArea) textArea.value = "";
      if (outputDiv) outputDiv.textContent = "";
    });
  }
});

//-----------------------------------------
// リロード時にリセット
//-----------------------------------------
window.addEventListener("load", () => {
  const [navEntry] = performance.getEntriesByType("navigation");
  if (navEntry && navEntry.type === "reload") {
    const textArea = document.querySelector("textarea[name='base_prompt']");
    const outputDiv = document.getElementById("txt-body");
    if (textArea) textArea.value = "";
    if (outputDiv) outputDiv.textContent = "";
  }
});

// BFCache 復元時
window.addEventListener("pageshow", (event) => {
  if (event.persisted) {
    const textArea = document.querySelector("textarea[name='base_prompt']");
    const outputDiv = document.getElementById("txt-body");
    if (textArea) textArea.value = "";
    if (outputDiv) outputDiv.textContent = "";
  }
});


//-----------------------------------------
// テンプレート取得（AJAX）
//-----------------------------------------
function initTemplates() {
  const emoji = document.getElementById("js-emoji");
  const tone = document.getElementById("js-tone");
  const category = document.getElementById("js-category");
  const list = document.getElementById("templates-list");

  if (!emoji || !tone || !category || !list) return;

  function fetchTemplates() {
    const params = new URLSearchParams({
      emoji: emoji.value,
      tone: tone.value,
      category: category.value
    });

    fetch(`/templates?${params.toString()}`, {
      method: "GET",
      headers: { "Accept": "text/html", "X-Requested-With": "XMLHttpRequest"}
    })
      .then(res => res.text())
      .then(html => {
        list.innerHTML = html;
        attachCopyHandlers();
      })
      .catch(err => console.error("fetch failed:", err));
  }

  [emoji, tone, category].forEach(sel => {
    sel.addEventListener("change", fetchTemplates);
  });
}
document.addEventListener("turbo:load", initTemplates);
document.addEventListener("DOMContentLoaded", initTemplates);


//-----------------------------------------
// コピー（テンプレート用）
//-----------------------------------------
function attachCopyHandlers() {
  const buttons = document.querySelectorAll(".copy-btn");

  buttons.forEach((btn) => {
    btn.addEventListener("click", async () => {
      try {
        const content = btn.getAttribute("data-content") || "";
        const toast = btn.closest(".copy-wrapper")?.querySelector(".copy-toast");

        if (!window.isSecureContext) throw new Error("insecure");
        await navigator.clipboard.writeText(content.trim());

        if (toast) {
          toast.style.display = "block";
          setTimeout(() => { toast.style.display = "none"; }, 1500);
        }
      } catch (e) {
        console.error("copy failed:", e);
      }
    });
  });
}
document.addEventListener("turbo:load", attachCopyHandlers);
document.addEventListener("DOMContentLoaded", attachCopyHandlers);


//-----------------------------------------
// 自動生成エリアのコピー
//-----------------------------------------
document.addEventListener("turbo:load", () => {
  const btn = document.getElementById("copy-btn");
  const txt = document.getElementById("txt-body");
  const toast = document.getElementById("copy-toast");

  if (btn && txt) {
    btn.addEventListener("click", async () => {
      try {
        await navigator.clipboard.writeText(txt.textContent.trim());
        if (toast) {
          toast.style.display = "block";
          setTimeout(() => { toast.style.display = "none"; }, 1500);
        }
      } catch (err) {
        console.error("copy failed:", err);
      }
    });
  }
});


//-----------------------------------------
// ラジオボタン 表示/非表示制御
//-----------------------------------------
document.addEventListener("turbo:load", initRadioVisibility);
document.addEventListener("DOMContentLoaded", initRadioVisibility);

function initRadioVisibility() {
  setupRadioToggle("emoji-select-pc", "emoji-radio-group-pc");
  setupRadioToggle("emoji-select-sp", "emoji-radio-group-sp");
}

// ★★ 正しい setupRadioToggle はこれ1つだけ！ ★★
function setupRadioToggle(selectId, groupId) {
  const select = document.getElementById(selectId);
  const radioGroup = document.getElementById(groupId);

  if (!select || !radioGroup) return;

  function toggle() {
    const value = select.value;
    console.log(`${selectId} 選択:`, value);

    if (value === "kansai") {
      radioGroup.classList.add("d-none");
    } else {
      radioGroup.classList.remove("d-none");
    }
  }

  toggle();
  select.addEventListener("change", toggle);
}
