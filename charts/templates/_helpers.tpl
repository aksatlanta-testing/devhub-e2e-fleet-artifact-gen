
{{- define "go-echob103c86e-967e-4231-b557-ede6b60a9e2e.name" -}}
{{- default .Chart.Name .Values.nameOverride | trunc 63 | trimSuffix "-" }}
{{- end }}


{{- define "go-echob103c86e-967e-4231-b557-ede6b60a9e2e.fullname" -}}
{{- if .Values.fullnameOverride }}
{{- .Values.fullnameOverride | trunc 63 | trimSuffix "-" }}
{{- else }}
{{- $name := default .Chart.Name .Values.nameOverride }}
{{- if contains $name .Release.Name }}
{{- .Release.Name | trunc 63 | trimSuffix "-" }}
{{- else }}
{{- printf "%s-%s" .Release.Name $name | trunc 63 | trimSuffix "-" }}
{{- end }}
{{- end }}
{{- end }}


{{- define "go-echob103c86e-967e-4231-b557-ede6b60a9e2e.chart" -}}
{{- printf "%s-%s" .Chart.Name .Chart.Version | replace "+" "_" | trunc 63 | trimSuffix "-" }}
{{- end }}


{{- define "go-echob103c86e-967e-4231-b557-ede6b60a9e2e.labels" -}}
helm.sh/chart: {{ include "go-echob103c86e-967e-4231-b557-ede6b60a9e2e.chart" . }}
{{ include "go-echob103c86e-967e-4231-b557-ede6b60a9e2e.selectorLabels" . }}
kubernetes.azure.com/generator: {{ .Values.generatorLabel }}
{{- if .Chart.AppVersion }}
app.kubernetes.io/version: {{ .Chart.AppVersion | quote }}
{{- end }}
app.kubernetes.io/managed-by: {{ .Release.Service }}
{{- end }}


{{- define "go-echob103c86e-967e-4231-b557-ede6b60a9e2e.selectorLabels" -}}
app.kubernetes.io/name: {{ include "go-echob103c86e-967e-4231-b557-ede6b60a9e2e.name" . }}
app.kubernetes.io/instance: {{ .Release.Name }}
{{- end }}