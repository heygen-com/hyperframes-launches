import { captureWebsite } from "../../../../repos/hyperframes/packages/cli/src/capture/index.ts";

const outputDir =
  "/Users/jakemoran/Desktop/CC/projects/active/heygen-iphone-canvas-test/captures/heygen-mobile";

const result = await captureWebsite(
  {
    url: "https://www.heygen.com",
    outputDir,
    viewportWidth: 390,
    viewportHeight: 844,
    settleTime: 5000,
    timeout: 120000,
    maxScreenshots: 20,
    skipAssets: false,
  },
  (stage, detail) => {
    console.log(detail ? `${stage}: ${detail}` : stage);
  },
);

console.log(
  JSON.stringify(
    {
      ok: result.ok,
      title: result.title,
      screenshots: result.screenshots,
      assets: result.assets.length,
      sections: result.tokens.sections.length,
      warnings: result.warnings,
    },
    null,
    2,
  ),
);
