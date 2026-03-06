return {
  "3rd/image.nvim",
  ft = { "png", "jpg", "jpeg", "gif", "webp", "bmp", "ico", "svg" },
  event = "BufReadPre *.png,*.jpg,*.jpeg,*.gif,*.webp,*.bmp,*.ico,*.svg",
  opts = {
    backend = "kitty",
    integrations = {
      markdown = {
        enabled = true,
        resolve_image_path = function(document_path, image_path, fallback)
          return fallback(document_path, image_path)
        end,
      },
    },
  },
}
