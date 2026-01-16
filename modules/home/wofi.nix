{
  programs.wofi = {
    enable = true;
    settings = {
      allow_markup = true;
      allow_images = true;
      width = 400;
      term = "kitty";
      content_halign = "fill";
      insensitive = true;
      dmenu-parse_action = true;
    };
    style = ''
      * {
          font-family: "Monaco", "SF Pro Display", "Inter", sans-serif;
          font-size: 14px;
          color: #333333; /* Ghostty foreground */
      }

      /* Main window background */
      window {
          background-color: rgba(204, 204, 204, 0.78); /* Ghostty background + opacity */
          border-radius: 12px;
          padding: 16px;
          border: 1px solid rgba(71, 71, 71, 0.35); /* subtle border, like Ghostty */
      }

      /* Search input field */
      #input {
          margin: 8px;
          padding: 6px 10px;
          border-radius: 8px;
          font-size: 14px;
          color: #333333;
          background-color: rgba(255, 255, 255, 0.6); /* slightly lighter than window */
          border: 1px solid rgba(71, 71, 71, 0.35);
          box-shadow: none;
          outline: none;
          caret-color: #333333;
      }

      /* Remove blue GTK focus glow */
      #input:focus {
          border: 1px solid rgba(71, 71, 71, 0.55);
          background-color: rgba(255, 255, 255, 0.75);
          box-shadow: none;
          outline: none;
      }

      /* Each entry row */
      #entry {
          padding: 6px 10px;
          border-radius: 6px;
          background-color: transparent;
          color: #333333;
      }

      /* Selected entry */
      #entry:selected {
          background-color: rgba(71, 71, 71, 0.15); /* subtle gray highlight */
          color: #111111;
      }

      /* Remove arrows (sub-actions) if still visible */
      #entry image:first-child {
          opacity: 0;
          min-width: 0;
          min-height: 0;
          margin: 0;
          padding: 0;
      }
    '';
  };
}
