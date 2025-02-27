
{{- define "go-echo69544f88-141a-42b4-969c-312d0f7784ff.name" -}}
{{- default .Chart.Name .Values.nameOverride | trunc 63 | trimSuffix "-" }}
{{- end }}


{{- define "go-echo69544f88-141a-42b4-969c-312d0f7784ff.fullname" -}}
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


{{- define "go-echo69544f88-141a-42b4-969c-312d0f7784ff.chart" -}}
{{- printf "%s-%s" .Chart.Name .Chart.Version | replace "+" "_" | trunc 63 | trimSuffix "-" }}
{{- end }}


{{- define "go-echo69544f88-141a-42b4-969c-312d0f7784ff.labels" -}}
helm.sh/chart: {{ include "go-echo69544f88-141a-42b4-969c-312d0f7784ff.chart" . }}
{{ include "go-echo69544f88-141a-42b4-969c-312d0f7784ff.selectorLabels" . }}
kubernetes.azure.com/generator: {{ .Values.generatorLabel }}
{{- if .Chart.AppVersion }}
app.kubernetes.io/version: {{ .Chart.AppVersion | quote }}
{{- end }}
app.kubernetes.io/managed-by: {{ .Release.Service }}
{{- end }}


{{- define "go-echo69544f88-141a-42b4-969c-312d0f7784ff.selectorLabels" -}}
app.kubernetes.io/name: {{ include "go-echo69544f88-141a-42b4-969c-312d0f7784ff.name" . }}
app.kubernetes.io/instance: {{ .Release.Name }}
{{- end }}