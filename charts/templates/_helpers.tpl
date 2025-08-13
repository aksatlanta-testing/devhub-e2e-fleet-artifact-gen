
{{- define "go-echo62d7e766-f33f-40c9-9306-788173c90981.name" -}}
{{- default .Chart.Name .Values.nameOverride | trunc 63 | trimSuffix "-" }}
{{- end }}


{{- define "go-echo62d7e766-f33f-40c9-9306-788173c90981.fullname" -}}
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


{{- define "go-echo62d7e766-f33f-40c9-9306-788173c90981.chart" -}}
{{- printf "%s-%s" .Chart.Name .Chart.Version | replace "+" "_" | trunc 63 | trimSuffix "-" }}
{{- end }}


{{- define "go-echo62d7e766-f33f-40c9-9306-788173c90981.labels" -}}
helm.sh/chart: {{ include "go-echo62d7e766-f33f-40c9-9306-788173c90981.chart" . }}
{{ include "go-echo62d7e766-f33f-40c9-9306-788173c90981.selectorLabels" . }}
kubernetes.azure.com/generator: {{ .Values.generatorLabel }}
{{- if .Chart.AppVersion }}
app.kubernetes.io/version: {{ .Chart.AppVersion | quote }}
{{- end }}
app.kubernetes.io/managed-by: {{ .Release.Service }}
{{- end }}


{{- define "go-echo62d7e766-f33f-40c9-9306-788173c90981.selectorLabels" -}}
app.kubernetes.io/name: {{ include "go-echo62d7e766-f33f-40c9-9306-788173c90981.name" . }}
app.kubernetes.io/instance: {{ .Release.Name }}
{{- end }}