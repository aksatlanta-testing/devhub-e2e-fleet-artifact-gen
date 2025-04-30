
{{- define "go-echo996aba4d-3cc4-445d-9326-c7ada7d08226.name" -}}
{{- default .Chart.Name .Values.nameOverride | trunc 63 | trimSuffix "-" }}
{{- end }}


{{- define "go-echo996aba4d-3cc4-445d-9326-c7ada7d08226.fullname" -}}
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


{{- define "go-echo996aba4d-3cc4-445d-9326-c7ada7d08226.chart" -}}
{{- printf "%s-%s" .Chart.Name .Chart.Version | replace "+" "_" | trunc 63 | trimSuffix "-" }}
{{- end }}


{{- define "go-echo996aba4d-3cc4-445d-9326-c7ada7d08226.labels" -}}
helm.sh/chart: {{ include "go-echo996aba4d-3cc4-445d-9326-c7ada7d08226.chart" . }}
{{ include "go-echo996aba4d-3cc4-445d-9326-c7ada7d08226.selectorLabels" . }}
kubernetes.azure.com/generator: {{ .Values.generatorLabel }}
{{- if .Chart.AppVersion }}
app.kubernetes.io/version: {{ .Chart.AppVersion | quote }}
{{- end }}
app.kubernetes.io/managed-by: {{ .Release.Service }}
{{- end }}


{{- define "go-echo996aba4d-3cc4-445d-9326-c7ada7d08226.selectorLabels" -}}
app.kubernetes.io/name: {{ include "go-echo996aba4d-3cc4-445d-9326-c7ada7d08226.name" . }}
app.kubernetes.io/instance: {{ .Release.Name }}
{{- end }}