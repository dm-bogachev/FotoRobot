namespace FotoRobot
{
    partial class MainWindow
    {
        /// <summary>
        /// Обязательная переменная конструктора.
        /// </summary>
        private System.ComponentModel.IContainer components = null;

        /// <summary>
        /// Освободить все используемые ресурсы.
        /// </summary>
        /// <param name="disposing">истинно, если управляемый ресурс должен быть удален; иначе ложно.</param>
        protected override void Dispose(bool disposing)
        {
            if (disposing && (components != null))
            {
                components.Dispose();
            }
            base.Dispose(disposing);
        }

        #region Код, автоматически созданный конструктором форм Windows

        /// <summary>
        /// Требуемый метод для поддержки конструктора — не изменяйте 
        /// содержимое этого метода с помощью редактора кода.
        /// </summary>
        private void InitializeComponent()
        {
            this.components = new System.ComponentModel.Container();
            System.ComponentModel.ComponentResourceManager resources = new System.ComponentModel.ComponentResourceManager(typeof(MainWindow));
            this.mainLayoutPanel = new System.Windows.Forms.TableLayoutPanel();
            this.buttonLayoutPanel = new System.Windows.Forms.TableLayoutPanel();
            this.buttonCamera = new System.Windows.Forms.Button();
            this.buttonCapture = new System.Windows.Forms.Button();
            this.buttonDraw = new System.Windows.Forms.Button();
            this.buttonSettings = new System.Windows.Forms.Button();
            this.buttonLoad = new System.Windows.Forms.Button();
            this.tableLayoutPanel1 = new System.Windows.Forms.TableLayoutPanel();
            this.ROIWidth = new FotoRobot.CTrackBar();
            this.cannyThreshold1 = new FotoRobot.CTrackBar();
            this.cannyThreshold2 = new FotoRobot.CTrackBar();
            this.ROIHeight = new FotoRobot.CTrackBar();
            this.panelBlur = new System.Windows.Forms.Panel();
            this.label1 = new System.Windows.Forms.Label();
            this.BlurValue = new System.Windows.Forms.ComboBox();
            this.MinContLength = new FotoRobot.CTrackBar();
            this.ApproximationEpsilon = new FotoRobot.CTrackBar();
            this.conStatus = new System.Windows.Forms.Label();
            this.checkBox1 = new System.Windows.Forms.CheckBox();
            this.isAdaptiveCanny = new System.Windows.Forms.CheckBox();
            this.buttonAdaptateCanny = new System.Windows.Forms.Button();
            this.imagePanels = new System.Windows.Forms.TableLayoutPanel();
            this.originalView = new Emgu.CV.UI.ImageBox();
            this.imageView = new Emgu.CV.UI.ImageBox();
            this.mainLayoutPanel.SuspendLayout();
            this.buttonLayoutPanel.SuspendLayout();
            this.tableLayoutPanel1.SuspendLayout();
            this.panelBlur.SuspendLayout();
            this.imagePanels.SuspendLayout();
            ((System.ComponentModel.ISupportInitialize)(this.originalView)).BeginInit();
            ((System.ComponentModel.ISupportInitialize)(this.imageView)).BeginInit();
            this.SuspendLayout();
            // 
            // mainLayoutPanel
            // 
            this.mainLayoutPanel.ColumnCount = 3;
            this.mainLayoutPanel.ColumnStyles.Add(new System.Windows.Forms.ColumnStyle(System.Windows.Forms.SizeType.Absolute, 104F));
            this.mainLayoutPanel.ColumnStyles.Add(new System.Windows.Forms.ColumnStyle(System.Windows.Forms.SizeType.Percent, 100F));
            this.mainLayoutPanel.ColumnStyles.Add(new System.Windows.Forms.ColumnStyle(System.Windows.Forms.SizeType.Absolute, 400F));
            this.mainLayoutPanel.Controls.Add(this.buttonLayoutPanel, 0, 0);
            this.mainLayoutPanel.Controls.Add(this.tableLayoutPanel1, 2, 0);
            this.mainLayoutPanel.Controls.Add(this.imagePanels, 1, 0);
            this.mainLayoutPanel.Dock = System.Windows.Forms.DockStyle.Fill;
            this.mainLayoutPanel.Location = new System.Drawing.Point(0, 0);
            this.mainLayoutPanel.Margin = new System.Windows.Forms.Padding(4, 4, 4, 4);
            this.mainLayoutPanel.Name = "mainLayoutPanel";
            this.mainLayoutPanel.RowCount = 1;
            this.mainLayoutPanel.RowStyles.Add(new System.Windows.Forms.RowStyle(System.Windows.Forms.SizeType.Percent, 100F));
            this.mainLayoutPanel.Size = new System.Drawing.Size(1247, 656);
            this.mainLayoutPanel.TabIndex = 4;
            // 
            // buttonLayoutPanel
            // 
            this.buttonLayoutPanel.ColumnCount = 1;
            this.buttonLayoutPanel.ColumnStyles.Add(new System.Windows.Forms.ColumnStyle(System.Windows.Forms.SizeType.Percent, 100F));
            this.buttonLayoutPanel.Controls.Add(this.buttonCamera, 0, 1);
            this.buttonLayoutPanel.Controls.Add(this.buttonCapture, 0, 2);
            this.buttonLayoutPanel.Controls.Add(this.buttonDraw, 0, 3);
            this.buttonLayoutPanel.Controls.Add(this.buttonSettings, 0, 8);
            this.buttonLayoutPanel.Controls.Add(this.buttonLoad, 0, 6);
            this.buttonLayoutPanel.Dock = System.Windows.Forms.DockStyle.Fill;
            this.buttonLayoutPanel.Location = new System.Drawing.Point(4, 4);
            this.buttonLayoutPanel.Margin = new System.Windows.Forms.Padding(4, 4, 4, 4);
            this.buttonLayoutPanel.Name = "buttonLayoutPanel";
            this.buttonLayoutPanel.RowCount = 10;
            this.buttonLayoutPanel.RowStyles.Add(new System.Windows.Forms.RowStyle(System.Windows.Forms.SizeType.Absolute, 25F));
            this.buttonLayoutPanel.RowStyles.Add(new System.Windows.Forms.RowStyle(System.Windows.Forms.SizeType.Absolute, 89F));
            this.buttonLayoutPanel.RowStyles.Add(new System.Windows.Forms.RowStyle(System.Windows.Forms.SizeType.Absolute, 89F));
            this.buttonLayoutPanel.RowStyles.Add(new System.Windows.Forms.RowStyle(System.Windows.Forms.SizeType.Absolute, 89F));
            this.buttonLayoutPanel.RowStyles.Add(new System.Windows.Forms.RowStyle(System.Windows.Forms.SizeType.Absolute, 89F));
            this.buttonLayoutPanel.RowStyles.Add(new System.Windows.Forms.RowStyle(System.Windows.Forms.SizeType.Absolute, 25F));
            this.buttonLayoutPanel.RowStyles.Add(new System.Windows.Forms.RowStyle(System.Windows.Forms.SizeType.Absolute, 89F));
            this.buttonLayoutPanel.RowStyles.Add(new System.Windows.Forms.RowStyle(System.Windows.Forms.SizeType.Absolute, 25F));
            this.buttonLayoutPanel.RowStyles.Add(new System.Windows.Forms.RowStyle(System.Windows.Forms.SizeType.Absolute, 89F));
            this.buttonLayoutPanel.RowStyles.Add(new System.Windows.Forms.RowStyle(System.Windows.Forms.SizeType.Absolute, 14F));
            this.buttonLayoutPanel.Size = new System.Drawing.Size(96, 648);
            this.buttonLayoutPanel.TabIndex = 0;
            // 
            // buttonCamera
            // 
            this.buttonCamera.Dock = System.Windows.Forms.DockStyle.Fill;
            this.buttonCamera.Enabled = false;
            this.buttonCamera.FlatAppearance.BorderSize = 0;
            this.buttonCamera.FlatStyle = System.Windows.Forms.FlatStyle.Flat;
            this.buttonCamera.Image = global::FotoRobot.Properties.Resources.play;
            this.buttonCamera.Location = new System.Drawing.Point(4, 29);
            this.buttonCamera.Margin = new System.Windows.Forms.Padding(4, 4, 4, 4);
            this.buttonCamera.Name = "buttonCamera";
            this.buttonCamera.Size = new System.Drawing.Size(88, 81);
            this.buttonCamera.TabIndex = 0;
            this.buttonCamera.UseVisualStyleBackColor = true;
            this.buttonCamera.Click += new System.EventHandler(this.buttonCamera_Click);
            // 
            // buttonCapture
            // 
            this.buttonCapture.Dock = System.Windows.Forms.DockStyle.Fill;
            this.buttonCapture.Enabled = false;
            this.buttonCapture.FlatAppearance.BorderSize = 0;
            this.buttonCapture.FlatStyle = System.Windows.Forms.FlatStyle.Flat;
            this.buttonCapture.Image = global::FotoRobot.Properties.Resources.camera;
            this.buttonCapture.Location = new System.Drawing.Point(4, 118);
            this.buttonCapture.Margin = new System.Windows.Forms.Padding(4, 4, 4, 4);
            this.buttonCapture.Name = "buttonCapture";
            this.buttonCapture.Size = new System.Drawing.Size(88, 81);
            this.buttonCapture.TabIndex = 3;
            this.buttonCapture.UseVisualStyleBackColor = true;
            this.buttonCapture.Click += new System.EventHandler(this.buttonCapture_Click);
            // 
            // buttonDraw
            // 
            this.buttonDraw.Dock = System.Windows.Forms.DockStyle.Fill;
            this.buttonDraw.Enabled = false;
            this.buttonDraw.FlatAppearance.BorderSize = 0;
            this.buttonDraw.FlatStyle = System.Windows.Forms.FlatStyle.Flat;
            this.buttonDraw.Image = global::FotoRobot.Properties.Resources.paint;
            this.buttonDraw.Location = new System.Drawing.Point(4, 207);
            this.buttonDraw.Margin = new System.Windows.Forms.Padding(4, 4, 4, 4);
            this.buttonDraw.Name = "buttonDraw";
            this.buttonDraw.Size = new System.Drawing.Size(88, 81);
            this.buttonDraw.TabIndex = 5;
            this.buttonDraw.UseVisualStyleBackColor = true;
            this.buttonDraw.Click += new System.EventHandler(this.buttonDraw_Click);
            // 
            // buttonSettings
            // 
            this.buttonSettings.Dock = System.Windows.Forms.DockStyle.Fill;
            this.buttonSettings.FlatAppearance.BorderSize = 0;
            this.buttonSettings.FlatStyle = System.Windows.Forms.FlatStyle.Flat;
            this.buttonSettings.Image = ((System.Drawing.Image)(resources.GetObject("buttonSettings.Image")));
            this.buttonSettings.Location = new System.Drawing.Point(4, 524);
            this.buttonSettings.Margin = new System.Windows.Forms.Padding(4, 4, 4, 4);
            this.buttonSettings.Name = "buttonSettings";
            this.buttonSettings.Size = new System.Drawing.Size(88, 81);
            this.buttonSettings.TabIndex = 6;
            this.buttonSettings.UseVisualStyleBackColor = true;
            this.buttonSettings.Click += new System.EventHandler(this.buttonSettings_Click);
            // 
            // buttonLoad
            // 
            this.buttonLoad.FlatAppearance.BorderSize = 0;
            this.buttonLoad.FlatStyle = System.Windows.Forms.FlatStyle.Flat;
            this.buttonLoad.Image = global::FotoRobot.Properties.Resources.load;
            this.buttonLoad.Location = new System.Drawing.Point(4, 410);
            this.buttonLoad.Margin = new System.Windows.Forms.Padding(4, 4, 4, 4);
            this.buttonLoad.Name = "buttonLoad";
            this.buttonLoad.Size = new System.Drawing.Size(88, 81);
            this.buttonLoad.TabIndex = 7;
            this.buttonLoad.UseVisualStyleBackColor = true;
            this.buttonLoad.Click += new System.EventHandler(this.buttonLoad_Click);
            // 
            // tableLayoutPanel1
            // 
            this.tableLayoutPanel1.ColumnCount = 1;
            this.tableLayoutPanel1.ColumnStyles.Add(new System.Windows.Forms.ColumnStyle(System.Windows.Forms.SizeType.Percent, 100F));
            this.tableLayoutPanel1.Controls.Add(this.ROIWidth, 0, 1);
            this.tableLayoutPanel1.Controls.Add(this.cannyThreshold1, 0, 7);
            this.tableLayoutPanel1.Controls.Add(this.cannyThreshold2, 0, 8);
            this.tableLayoutPanel1.Controls.Add(this.ROIHeight, 0, 2);
            this.tableLayoutPanel1.Controls.Add(this.panelBlur, 0, 5);
            this.tableLayoutPanel1.Controls.Add(this.MinContLength, 0, 11);
            this.tableLayoutPanel1.Controls.Add(this.ApproximationEpsilon, 0, 10);
            this.tableLayoutPanel1.Controls.Add(this.conStatus, 0, 0);
            this.tableLayoutPanel1.Controls.Add(this.checkBox1, 0, 4);
            this.tableLayoutPanel1.Controls.Add(this.isAdaptiveCanny, 0, 12);
            this.tableLayoutPanel1.Controls.Add(this.buttonAdaptateCanny, 0, 6);
            this.tableLayoutPanel1.Dock = System.Windows.Forms.DockStyle.Fill;
            this.tableLayoutPanel1.Location = new System.Drawing.Point(851, 4);
            this.tableLayoutPanel1.Margin = new System.Windows.Forms.Padding(4, 4, 4, 4);
            this.tableLayoutPanel1.Name = "tableLayoutPanel1";
            this.tableLayoutPanel1.RowCount = 13;
            this.tableLayoutPanel1.RowStyles.Add(new System.Windows.Forms.RowStyle(System.Windows.Forms.SizeType.Absolute, 25F));
            this.tableLayoutPanel1.RowStyles.Add(new System.Windows.Forms.RowStyle(System.Windows.Forms.SizeType.Absolute, 62F));
            this.tableLayoutPanel1.RowStyles.Add(new System.Windows.Forms.RowStyle(System.Windows.Forms.SizeType.Absolute, 62F));
            this.tableLayoutPanel1.RowStyles.Add(new System.Windows.Forms.RowStyle(System.Windows.Forms.SizeType.Absolute, 25F));
            this.tableLayoutPanel1.RowStyles.Add(new System.Windows.Forms.RowStyle(System.Windows.Forms.SizeType.Absolute, 31F));
            this.tableLayoutPanel1.RowStyles.Add(new System.Windows.Forms.RowStyle(System.Windows.Forms.SizeType.Absolute, 62F));
            this.tableLayoutPanel1.RowStyles.Add(new System.Windows.Forms.RowStyle(System.Windows.Forms.SizeType.Absolute, 49F));
            this.tableLayoutPanel1.RowStyles.Add(new System.Windows.Forms.RowStyle(System.Windows.Forms.SizeType.Absolute, 62F));
            this.tableLayoutPanel1.RowStyles.Add(new System.Windows.Forms.RowStyle(System.Windows.Forms.SizeType.Absolute, 62F));
            this.tableLayoutPanel1.RowStyles.Add(new System.Windows.Forms.RowStyle(System.Windows.Forms.SizeType.Absolute, 25F));
            this.tableLayoutPanel1.RowStyles.Add(new System.Windows.Forms.RowStyle(System.Windows.Forms.SizeType.Absolute, 62F));
            this.tableLayoutPanel1.RowStyles.Add(new System.Windows.Forms.RowStyle(System.Windows.Forms.SizeType.Absolute, 62F));
            this.tableLayoutPanel1.RowStyles.Add(new System.Windows.Forms.RowStyle(System.Windows.Forms.SizeType.Absolute, 25F));
            this.tableLayoutPanel1.Size = new System.Drawing.Size(392, 648);
            this.tableLayoutPanel1.TabIndex = 3;
            // 
            // ROIWidth
            // 
            this.ROIWidth.Dock = System.Windows.Forms.DockStyle.Fill;
            this.ROIWidth.Location = new System.Drawing.Point(5, 30);
            this.ROIWidth.Margin = new System.Windows.Forms.Padding(5, 5, 5, 5);
            this.ROIWidth.MaximumSize = new System.Drawing.Size(133333337, 55);
            this.ROIWidth.MaximumValue = 1024;
            this.ROIWidth.MinimumSize = new System.Drawing.Size(0, 55);
            this.ROIWidth.MinimumValue = 1;
            this.ROIWidth.Name = "ROIWidth";
            this.ROIWidth.Size = new System.Drawing.Size(382, 55);
            this.ROIWidth.TabIndex = 0;
            this.ROIWidth.TrackbarLabel = "ROI Width:";
            this.ROIWidth.Value = 1;
            // 
            // cannyThreshold1
            // 
            this.cannyThreshold1.Dock = System.Windows.Forms.DockStyle.Fill;
            this.cannyThreshold1.Location = new System.Drawing.Point(5, 321);
            this.cannyThreshold1.Margin = new System.Windows.Forms.Padding(5, 5, 5, 5);
            this.cannyThreshold1.MaximumSize = new System.Drawing.Size(133333337, 55);
            this.cannyThreshold1.MaximumValue = 512;
            this.cannyThreshold1.MinimumSize = new System.Drawing.Size(0, 55);
            this.cannyThreshold1.MinimumValue = 1;
            this.cannyThreshold1.Name = "cannyThreshold1";
            this.cannyThreshold1.Size = new System.Drawing.Size(382, 55);
            this.cannyThreshold1.TabIndex = 1;
            this.cannyThreshold1.TrackbarLabel = "Canny threshold 1:";
            this.cannyThreshold1.Value = 1;
            // 
            // cannyThreshold2
            // 
            this.cannyThreshold2.Dock = System.Windows.Forms.DockStyle.Fill;
            this.cannyThreshold2.Location = new System.Drawing.Point(5, 383);
            this.cannyThreshold2.Margin = new System.Windows.Forms.Padding(5, 5, 5, 5);
            this.cannyThreshold2.MaximumSize = new System.Drawing.Size(133333337, 55);
            this.cannyThreshold2.MaximumValue = 512;
            this.cannyThreshold2.MinimumSize = new System.Drawing.Size(0, 55);
            this.cannyThreshold2.MinimumValue = 1;
            this.cannyThreshold2.Name = "cannyThreshold2";
            this.cannyThreshold2.Size = new System.Drawing.Size(382, 55);
            this.cannyThreshold2.TabIndex = 2;
            this.cannyThreshold2.TrackbarLabel = "Canny threshold 2:";
            this.cannyThreshold2.Value = 1;
            // 
            // ROIHeight
            // 
            this.ROIHeight.Dock = System.Windows.Forms.DockStyle.Fill;
            this.ROIHeight.Location = new System.Drawing.Point(5, 92);
            this.ROIHeight.Margin = new System.Windows.Forms.Padding(5, 5, 5, 5);
            this.ROIHeight.MaximumSize = new System.Drawing.Size(133333337, 55);
            this.ROIHeight.MaximumValue = 1024;
            this.ROIHeight.MinimumSize = new System.Drawing.Size(0, 55);
            this.ROIHeight.MinimumValue = 1;
            this.ROIHeight.Name = "ROIHeight";
            this.ROIHeight.Size = new System.Drawing.Size(382, 55);
            this.ROIHeight.TabIndex = 5;
            this.ROIHeight.TrackbarLabel = "ROI Height:";
            this.ROIHeight.Value = 1;
            // 
            // panelBlur
            // 
            this.panelBlur.Controls.Add(this.label1);
            this.panelBlur.Controls.Add(this.BlurValue);
            this.panelBlur.Dock = System.Windows.Forms.DockStyle.Fill;
            this.panelBlur.Location = new System.Drawing.Point(4, 209);
            this.panelBlur.Margin = new System.Windows.Forms.Padding(4, 4, 4, 4);
            this.panelBlur.Name = "panelBlur";
            this.panelBlur.Size = new System.Drawing.Size(384, 54);
            this.panelBlur.TabIndex = 6;
            // 
            // label1
            // 
            this.label1.AutoSize = true;
            this.label1.Location = new System.Drawing.Point(4, 5);
            this.label1.Margin = new System.Windows.Forms.Padding(4, 0, 4, 0);
            this.label1.Name = "label1";
            this.label1.Size = new System.Drawing.Size(70, 17);
            this.label1.TabIndex = 1;
            this.label1.Text = "Blur level:";
            // 
            // BlurValue
            // 
            this.BlurValue.DropDownStyle = System.Windows.Forms.ComboBoxStyle.DropDownList;
            this.BlurValue.FormattingEnabled = true;
            this.BlurValue.Items.AddRange(new object[] {
            "1",
            "3",
            "5",
            "7",
            "9",
            "11",
            "13",
            "15"});
            this.BlurValue.Location = new System.Drawing.Point(4, 25);
            this.BlurValue.Margin = new System.Windows.Forms.Padding(4, 4, 4, 4);
            this.BlurValue.Name = "BlurValue";
            this.BlurValue.Size = new System.Drawing.Size(104, 24);
            this.BlurValue.TabIndex = 0;
            // 
            // MinContLength
            // 
            this.MinContLength.Dock = System.Windows.Forms.DockStyle.Fill;
            this.MinContLength.Location = new System.Drawing.Point(5, 532);
            this.MinContLength.Margin = new System.Windows.Forms.Padding(5, 5, 5, 5);
            this.MinContLength.MaximumSize = new System.Drawing.Size(133333337, 55);
            this.MinContLength.MaximumValue = 255;
            this.MinContLength.MinimumSize = new System.Drawing.Size(0, 55);
            this.MinContLength.MinimumValue = 0;
            this.MinContLength.Name = "MinContLength";
            this.MinContLength.Size = new System.Drawing.Size(382, 55);
            this.MinContLength.TabIndex = 7;
            this.MinContLength.TrackbarLabel = "Minimal contour length:";
            this.MinContLength.Value = 0;
            // 
            // ApproximationEpsilon
            // 
            this.ApproximationEpsilon.Dock = System.Windows.Forms.DockStyle.Fill;
            this.ApproximationEpsilon.Location = new System.Drawing.Point(5, 470);
            this.ApproximationEpsilon.Margin = new System.Windows.Forms.Padding(5, 5, 5, 5);
            this.ApproximationEpsilon.MaximumSize = new System.Drawing.Size(133333337, 55);
            this.ApproximationEpsilon.MaximumValue = 500;
            this.ApproximationEpsilon.MinimumSize = new System.Drawing.Size(0, 55);
            this.ApproximationEpsilon.MinimumValue = 1;
            this.ApproximationEpsilon.Name = "ApproximationEpsilon";
            this.ApproximationEpsilon.Size = new System.Drawing.Size(382, 55);
            this.ApproximationEpsilon.TabIndex = 8;
            this.ApproximationEpsilon.TrackbarLabel = "Approximation epsilon:";
            this.ApproximationEpsilon.Value = 1;
            // 
            // conStatus
            // 
            this.conStatus.AutoSize = true;
            this.conStatus.Dock = System.Windows.Forms.DockStyle.Fill;
            this.conStatus.Location = new System.Drawing.Point(4, 0);
            this.conStatus.Margin = new System.Windows.Forms.Padding(4, 0, 4, 0);
            this.conStatus.Name = "conStatus";
            this.conStatus.Size = new System.Drawing.Size(384, 25);
            this.conStatus.TabIndex = 9;
            this.conStatus.Text = "label2";
            this.conStatus.TextAlign = System.Drawing.ContentAlignment.MiddleLeft;
            // 
            // checkBox1
            // 
            this.checkBox1.AutoSize = true;
            this.checkBox1.Location = new System.Drawing.Point(4, 178);
            this.checkBox1.Margin = new System.Windows.Forms.Padding(4, 4, 4, 4);
            this.checkBox1.Name = "checkBox1";
            this.checkBox1.Size = new System.Drawing.Size(98, 21);
            this.checkBox1.TabIndex = 10;
            this.checkBox1.Text = "checkBox1";
            this.checkBox1.UseVisualStyleBackColor = true;
            this.checkBox1.Visible = false;
            // 
            // isAdaptiveCanny
            // 
            this.isAdaptiveCanny.AutoSize = true;
            this.isAdaptiveCanny.CheckAlign = System.Drawing.ContentAlignment.MiddleRight;
            this.isAdaptiveCanny.Cursor = System.Windows.Forms.Cursors.Arrow;
            this.isAdaptiveCanny.Location = new System.Drawing.Point(4, 593);
            this.isAdaptiveCanny.Margin = new System.Windows.Forms.Padding(4, 4, 4, 4);
            this.isAdaptiveCanny.Name = "isAdaptiveCanny";
            this.isAdaptiveCanny.Size = new System.Drawing.Size(131, 21);
            this.isAdaptiveCanny.TabIndex = 3;
            this.isAdaptiveCanny.Text = "Adaptive canny:";
            this.isAdaptiveCanny.UseVisualStyleBackColor = true;
            this.isAdaptiveCanny.CheckedChanged += new System.EventHandler(this.isAdaptiveCanny_CheckedChanged);
            // 
            // buttonAdaptateCanny
            // 
            this.buttonAdaptateCanny.Dock = System.Windows.Forms.DockStyle.Left;
            this.buttonAdaptateCanny.Location = new System.Drawing.Point(4, 271);
            this.buttonAdaptateCanny.Margin = new System.Windows.Forms.Padding(4, 4, 4, 4);
            this.buttonAdaptateCanny.Name = "buttonAdaptateCanny";
            this.buttonAdaptateCanny.Size = new System.Drawing.Size(137, 41);
            this.buttonAdaptateCanny.TabIndex = 11;
            this.buttonAdaptateCanny.Text = "Adaptate";
            this.buttonAdaptateCanny.UseVisualStyleBackColor = true;
            this.buttonAdaptateCanny.Click += new System.EventHandler(this.buttonAdaptateCanny_Click);
            // 
            // imagePanels
            // 
            this.imagePanels.ColumnCount = 2;
            this.imagePanels.ColumnStyles.Add(new System.Windows.Forms.ColumnStyle(System.Windows.Forms.SizeType.Percent, 50.63521F));
            this.imagePanels.ColumnStyles.Add(new System.Windows.Forms.ColumnStyle(System.Windows.Forms.SizeType.Percent, 49.36479F));
            this.imagePanels.Controls.Add(this.originalView, 0, 0);
            this.imagePanels.Controls.Add(this.imageView, 1, 0);
            this.imagePanels.Dock = System.Windows.Forms.DockStyle.Fill;
            this.imagePanels.Location = new System.Drawing.Point(108, 4);
            this.imagePanels.Margin = new System.Windows.Forms.Padding(4, 4, 4, 4);
            this.imagePanels.Name = "imagePanels";
            this.imagePanels.RowCount = 1;
            this.imagePanels.RowStyles.Add(new System.Windows.Forms.RowStyle(System.Windows.Forms.SizeType.Percent, 50F));
            this.imagePanels.Size = new System.Drawing.Size(735, 648);
            this.imagePanels.TabIndex = 4;
            // 
            // originalView
            // 
            this.originalView.Dock = System.Windows.Forms.DockStyle.Fill;
            this.originalView.FunctionalMode = Emgu.CV.UI.ImageBox.FunctionalModeOption.PanAndZoom;
            this.originalView.Location = new System.Drawing.Point(4, 4);
            this.originalView.Margin = new System.Windows.Forms.Padding(4, 4, 4, 4);
            this.originalView.Name = "originalView";
            this.originalView.Size = new System.Drawing.Size(364, 640);
            this.originalView.SizeMode = System.Windows.Forms.PictureBoxSizeMode.CenterImage;
            this.originalView.TabIndex = 5;
            this.originalView.TabStop = false;
            // 
            // imageView
            // 
            this.imageView.Dock = System.Windows.Forms.DockStyle.Fill;
            this.imageView.FunctionalMode = Emgu.CV.UI.ImageBox.FunctionalModeOption.RightClickMenu;
            this.imageView.Location = new System.Drawing.Point(376, 4);
            this.imageView.Margin = new System.Windows.Forms.Padding(4, 4, 4, 4);
            this.imageView.Name = "imageView";
            this.imageView.Size = new System.Drawing.Size(355, 640);
            this.imageView.SizeMode = System.Windows.Forms.PictureBoxSizeMode.CenterImage;
            this.imageView.TabIndex = 3;
            this.imageView.TabStop = false;
            this.imageView.MouseDown += new System.Windows.Forms.MouseEventHandler(this.imageView_MouseDown);
            this.imageView.MouseMove += new System.Windows.Forms.MouseEventHandler(this.imageView_MouseMove);
            // 
            // MainWindow
            // 
            this.AutoScaleDimensions = new System.Drawing.SizeF(8F, 16F);
            this.AutoScaleMode = System.Windows.Forms.AutoScaleMode.Font;
            this.ClientSize = new System.Drawing.Size(1247, 656);
            this.Controls.Add(this.mainLayoutPanel);
            this.HelpButton = true;
            this.Icon = ((System.Drawing.Icon)(resources.GetObject("$this.Icon")));
            this.Margin = new System.Windows.Forms.Padding(4, 4, 4, 4);
            this.Name = "MainWindow";
            this.Text = "Artist";
            this.WindowState = System.Windows.Forms.FormWindowState.Maximized;
            this.FormClosing += new System.Windows.Forms.FormClosingEventHandler(this.MainWindow_FormClosing);
            this.mainLayoutPanel.ResumeLayout(false);
            this.buttonLayoutPanel.ResumeLayout(false);
            this.tableLayoutPanel1.ResumeLayout(false);
            this.tableLayoutPanel1.PerformLayout();
            this.panelBlur.ResumeLayout(false);
            this.panelBlur.PerformLayout();
            this.imagePanels.ResumeLayout(false);
            ((System.ComponentModel.ISupportInitialize)(this.originalView)).EndInit();
            ((System.ComponentModel.ISupportInitialize)(this.imageView)).EndInit();
            this.ResumeLayout(false);

        }

        #endregion

        private System.Windows.Forms.Button buttonCamera;
        private System.Windows.Forms.Button buttonCapture;
        private System.Windows.Forms.TableLayoutPanel mainLayoutPanel;
        private System.Windows.Forms.TableLayoutPanel buttonLayoutPanel;
        private System.Windows.Forms.Button buttonDraw;
        private System.Windows.Forms.TableLayoutPanel tableLayoutPanel1;
        private CTrackBar ROIWidth;
        private CTrackBar cannyThreshold1;
        private CTrackBar cannyThreshold2;
        private System.Windows.Forms.CheckBox isAdaptiveCanny;
        private CTrackBar ROIHeight;
        private System.Windows.Forms.Panel panelBlur;
        private System.Windows.Forms.Label label1;
        private System.Windows.Forms.ComboBox BlurValue;
        private CTrackBar MinContLength;
        private CTrackBar ApproximationEpsilon;
        private System.Windows.Forms.Button buttonSettings;
        private System.Windows.Forms.Label conStatus;
        private System.Windows.Forms.Button buttonLoad;
        private System.Windows.Forms.TableLayoutPanel imagePanels;
        private Emgu.CV.UI.ImageBox imageView;
        private Emgu.CV.UI.ImageBox originalView;
        private System.Windows.Forms.CheckBox checkBox1;
        private System.Windows.Forms.Button buttonAdaptateCanny;
        //private CTrackbar cTrackbar1;
    }
}

