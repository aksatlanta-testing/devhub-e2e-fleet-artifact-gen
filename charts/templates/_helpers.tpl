
{{- define "go-echo3d2fb13a-f9f6-4c61-901c-f9ed2661a4bf.name" -}}
{{- default .Chart.Name .Values.nameOverride | trunc 63 | trimSuffix "-" }}
{{- end }}


{{- define "go-echo3d2fb13a-f9f6-4c61-901c-f9ed2661a4bf.fullname" -}}
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


{{- define "go-echo3d2fb13a-f9f6-4c61-901c-f9ed2661a4bf.chart" -}}
{{- printf "%s-%s" .Chart.Name .Chart.Version | replace "+" "_" | trunc 63 | trimSuffix "-" }}
{{- end }}


{{- define "go-echo3d2fb13a-f9f6-4c61-901c-f9ed2661a4bf.labels" -}}
helm.sh/chart: {{ include "go-echo3d2fb13a-f9f6-4c61-901c-f9ed2661a4bf.chart" . }}
{{ include "go-echo3d2fb13a-f9f6-4c61-901c-f9ed2661a4bf.selectorLabels" . }}
kubernetes.azure.com/generator: {{ .Values.generatorLabel }}
{{- if .Chart.AppVersion }}
app.kubernetes.io/version: {{ .Chart.AppVersion | quote }}
{{- end }}
app.kubernetes.io/managed-by: {{ .Release.Service }}
{{- end }}


{{- define "go-echo3d2fb13a-f9f6-4c61-901c-f9ed2661a4bf.selectorLabels" -}}
app.kubernetes.io/name: {{ include "go-echo3d2fb13a-f9f6-4c61-901c-f9ed2661a4bf.name" . }}
app.kubernetes.io/instance: {{ .Release.Name }}
{{- end }}