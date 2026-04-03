/** @jsxImportSource @opentui/solid */
import type { TuiPlugin } from "@opencode-ai/plugin/tui"

const tui: TuiPlugin = async (api, options) => {
  const label = typeof options?.label === "string" ? options.label : "With_coffeemix_all"

  api.slots.register({
    order: 1000,
    slots: {
      home_bottom() {
        return (
          <box paddingTop={0} paddingBottom={0}>
            <text dimColor>{`☕ ${label}`}</text>
          </box>
        )
      },
    },
  })
}

export default {
  id: "coffeemix_all.badge",
  tui,
}
