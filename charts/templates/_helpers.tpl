
{{- define "go-echo31f17e62-df0c-4797-b308-7275622f89da.name" -}}
{{- default .Chart.Name .Values.nameOverride | trunc 63 | trimSuffix "-" }}
{{- end }}


{{- define "go-echo31f17e62-df0c-4797-b308-7275622f89da.fullname" -}}
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


{{- define "go-echo31f17e62-df0c-4797-b308-7275622f89da.chart" -}}
{{- printf "%s-%s" .Chart.Name .Chart.Version | replace "+" "_" | trunc 63 | trimSuffix "-" }}
{{- end }}


{{- define "go-echo31f17e62-df0c-4797-b308-7275622f89da.labels" -}}
helm.sh/chart: {{ include "go-echo31f17e62-df0c-4797-b308-7275622f89da.chart" . }}
{{ include "go-echo31f17e62-df0c-4797-b308-7275622f89da.selectorLabels" . }}
kubernetes.azure.com/generator: {{ .Values.generatorLabel }}
{{- if .Chart.AppVersion }}
app.kubernetes.io/version: {{ .Chart.AppVersion | quote }}
{{- end }}
app.kubernetes.io/managed-by: {{ .Release.Service }}
{{- end }}


{{- define "go-echo31f17e62-df0c-4797-b308-7275622f89da.selectorLabels" -}}
app.kubernetes.io/name: {{ include "go-echo31f17e62-df0c-4797-b308-7275622f89da.name" . }}
app.kubernetes.io/instance: {{ .Release.Name }}
{{- end }}