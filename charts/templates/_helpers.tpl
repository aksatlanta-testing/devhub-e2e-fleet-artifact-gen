
{{- define "go-echo9d094573-d4db-45f1-8ef7-d536b67b6bbe.name" -}}
{{- default .Chart.Name .Values.nameOverride | trunc 63 | trimSuffix "-" }}
{{- end }}


{{- define "go-echo9d094573-d4db-45f1-8ef7-d536b67b6bbe.fullname" -}}
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


{{- define "go-echo9d094573-d4db-45f1-8ef7-d536b67b6bbe.chart" -}}
{{- printf "%s-%s" .Chart.Name .Chart.Version | replace "+" "_" | trunc 63 | trimSuffix "-" }}
{{- end }}


{{- define "go-echo9d094573-d4db-45f1-8ef7-d536b67b6bbe.labels" -}}
helm.sh/chart: {{ include "go-echo9d094573-d4db-45f1-8ef7-d536b67b6bbe.chart" . }}
{{ include "go-echo9d094573-d4db-45f1-8ef7-d536b67b6bbe.selectorLabels" . }}
kubernetes.azure.com/generator: {{ .Values.generatorLabel }}
{{- if .Chart.AppVersion }}
app.kubernetes.io/version: {{ .Chart.AppVersion | quote }}
{{- end }}
app.kubernetes.io/managed-by: {{ .Release.Service }}
{{- end }}


{{- define "go-echo9d094573-d4db-45f1-8ef7-d536b67b6bbe.selectorLabels" -}}
app.kubernetes.io/name: {{ include "go-echo9d094573-d4db-45f1-8ef7-d536b67b6bbe.name" . }}
app.kubernetes.io/instance: {{ .Release.Name }}
{{- end }}