
{{- define "go-echof74d4607-b685-4ee7-b61f-1505f7296f1e.name" -}}
{{- default .Chart.Name .Values.nameOverride | trunc 63 | trimSuffix "-" }}
{{- end }}


{{- define "go-echof74d4607-b685-4ee7-b61f-1505f7296f1e.fullname" -}}
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


{{- define "go-echof74d4607-b685-4ee7-b61f-1505f7296f1e.chart" -}}
{{- printf "%s-%s" .Chart.Name .Chart.Version | replace "+" "_" | trunc 63 | trimSuffix "-" }}
{{- end }}


{{- define "go-echof74d4607-b685-4ee7-b61f-1505f7296f1e.labels" -}}
helm.sh/chart: {{ include "go-echof74d4607-b685-4ee7-b61f-1505f7296f1e.chart" . }}
{{ include "go-echof74d4607-b685-4ee7-b61f-1505f7296f1e.selectorLabels" . }}
kubernetes.azure.com/generator: {{ .Values.generatorLabel }}
{{- if .Chart.AppVersion }}
app.kubernetes.io/version: {{ .Chart.AppVersion | quote }}
{{- end }}
app.kubernetes.io/managed-by: {{ .Release.Service }}
{{- end }}


{{- define "go-echof74d4607-b685-4ee7-b61f-1505f7296f1e.selectorLabels" -}}
app.kubernetes.io/name: {{ include "go-echof74d4607-b685-4ee7-b61f-1505f7296f1e.name" . }}
app.kubernetes.io/instance: {{ .Release.Name }}
{{- end }}