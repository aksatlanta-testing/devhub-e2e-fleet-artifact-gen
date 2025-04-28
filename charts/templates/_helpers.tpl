
{{- define "go-echo47e427be-b05c-4fd9-b6fa-a790a52614ed.name" -}}
{{- default .Chart.Name .Values.nameOverride | trunc 63 | trimSuffix "-" }}
{{- end }}


{{- define "go-echo47e427be-b05c-4fd9-b6fa-a790a52614ed.fullname" -}}
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


{{- define "go-echo47e427be-b05c-4fd9-b6fa-a790a52614ed.chart" -}}
{{- printf "%s-%s" .Chart.Name .Chart.Version | replace "+" "_" | trunc 63 | trimSuffix "-" }}
{{- end }}


{{- define "go-echo47e427be-b05c-4fd9-b6fa-a790a52614ed.labels" -}}
helm.sh/chart: {{ include "go-echo47e427be-b05c-4fd9-b6fa-a790a52614ed.chart" . }}
{{ include "go-echo47e427be-b05c-4fd9-b6fa-a790a52614ed.selectorLabels" . }}
kubernetes.azure.com/generator: {{ .Values.generatorLabel }}
{{- if .Chart.AppVersion }}
app.kubernetes.io/version: {{ .Chart.AppVersion | quote }}
{{- end }}
app.kubernetes.io/managed-by: {{ .Release.Service }}
{{- end }}


{{- define "go-echo47e427be-b05c-4fd9-b6fa-a790a52614ed.selectorLabels" -}}
app.kubernetes.io/name: {{ include "go-echo47e427be-b05c-4fd9-b6fa-a790a52614ed.name" . }}
app.kubernetes.io/instance: {{ .Release.Name }}
{{- end }}