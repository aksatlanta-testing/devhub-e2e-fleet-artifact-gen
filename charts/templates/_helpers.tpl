
{{- define "go-echobaac7993-b4e2-4f25-8bcb-81669d0cccdb.name" -}}
{{- default .Chart.Name .Values.nameOverride | trunc 63 | trimSuffix "-" }}
{{- end }}


{{- define "go-echobaac7993-b4e2-4f25-8bcb-81669d0cccdb.fullname" -}}
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


{{- define "go-echobaac7993-b4e2-4f25-8bcb-81669d0cccdb.chart" -}}
{{- printf "%s-%s" .Chart.Name .Chart.Version | replace "+" "_" | trunc 63 | trimSuffix "-" }}
{{- end }}


{{- define "go-echobaac7993-b4e2-4f25-8bcb-81669d0cccdb.labels" -}}
helm.sh/chart: {{ include "go-echobaac7993-b4e2-4f25-8bcb-81669d0cccdb.chart" . }}
{{ include "go-echobaac7993-b4e2-4f25-8bcb-81669d0cccdb.selectorLabels" . }}
kubernetes.azure.com/generator: {{ .Values.generatorLabel }}
{{- if .Chart.AppVersion }}
app.kubernetes.io/version: {{ .Chart.AppVersion | quote }}
{{- end }}
app.kubernetes.io/managed-by: {{ .Release.Service }}
{{- end }}


{{- define "go-echobaac7993-b4e2-4f25-8bcb-81669d0cccdb.selectorLabels" -}}
app.kubernetes.io/name: {{ include "go-echobaac7993-b4e2-4f25-8bcb-81669d0cccdb.name" . }}
app.kubernetes.io/instance: {{ .Release.Name }}
{{- end }}