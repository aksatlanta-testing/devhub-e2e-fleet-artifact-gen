
{{- define "go-echof4b22b44-bfce-4319-bda0-5df30cf13519.name" -}}
{{- default .Chart.Name .Values.nameOverride | trunc 63 | trimSuffix "-" }}
{{- end }}


{{- define "go-echof4b22b44-bfce-4319-bda0-5df30cf13519.fullname" -}}
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


{{- define "go-echof4b22b44-bfce-4319-bda0-5df30cf13519.chart" -}}
{{- printf "%s-%s" .Chart.Name .Chart.Version | replace "+" "_" | trunc 63 | trimSuffix "-" }}
{{- end }}


{{- define "go-echof4b22b44-bfce-4319-bda0-5df30cf13519.labels" -}}
helm.sh/chart: {{ include "go-echof4b22b44-bfce-4319-bda0-5df30cf13519.chart" . }}
{{ include "go-echof4b22b44-bfce-4319-bda0-5df30cf13519.selectorLabels" . }}
kubernetes.azure.com/generator: {{ .Values.generatorLabel }}
{{- if .Chart.AppVersion }}
app.kubernetes.io/version: {{ .Chart.AppVersion | quote }}
{{- end }}
app.kubernetes.io/managed-by: {{ .Release.Service }}
{{- end }}


{{- define "go-echof4b22b44-bfce-4319-bda0-5df30cf13519.selectorLabels" -}}
app.kubernetes.io/name: {{ include "go-echof4b22b44-bfce-4319-bda0-5df30cf13519.name" . }}
app.kubernetes.io/instance: {{ .Release.Name }}
{{- end }}