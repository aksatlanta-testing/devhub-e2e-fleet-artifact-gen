
{{- define "go-echof762b6f2-1fbe-4b0e-9419-3fc42f2c9810.name" -}}
{{- default .Chart.Name .Values.nameOverride | trunc 63 | trimSuffix "-" }}
{{- end }}


{{- define "go-echof762b6f2-1fbe-4b0e-9419-3fc42f2c9810.fullname" -}}
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


{{- define "go-echof762b6f2-1fbe-4b0e-9419-3fc42f2c9810.chart" -}}
{{- printf "%s-%s" .Chart.Name .Chart.Version | replace "+" "_" | trunc 63 | trimSuffix "-" }}
{{- end }}


{{- define "go-echof762b6f2-1fbe-4b0e-9419-3fc42f2c9810.labels" -}}
helm.sh/chart: {{ include "go-echof762b6f2-1fbe-4b0e-9419-3fc42f2c9810.chart" . }}
{{ include "go-echof762b6f2-1fbe-4b0e-9419-3fc42f2c9810.selectorLabels" . }}
kubernetes.azure.com/generator: {{ .Values.generatorLabel }}
{{- if .Chart.AppVersion }}
app.kubernetes.io/version: {{ .Chart.AppVersion | quote }}
{{- end }}
app.kubernetes.io/managed-by: {{ .Release.Service }}
{{- end }}


{{- define "go-echof762b6f2-1fbe-4b0e-9419-3fc42f2c9810.selectorLabels" -}}
app.kubernetes.io/name: {{ include "go-echof762b6f2-1fbe-4b0e-9419-3fc42f2c9810.name" . }}
app.kubernetes.io/instance: {{ .Release.Name }}
{{- end }}