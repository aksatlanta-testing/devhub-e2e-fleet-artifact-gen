
{{- define "go-echocc5e866f-2954-4c93-9211-fdd76ff89ced.name" -}}
{{- default .Chart.Name .Values.nameOverride | trunc 63 | trimSuffix "-" }}
{{- end }}


{{- define "go-echocc5e866f-2954-4c93-9211-fdd76ff89ced.fullname" -}}
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


{{- define "go-echocc5e866f-2954-4c93-9211-fdd76ff89ced.chart" -}}
{{- printf "%s-%s" .Chart.Name .Chart.Version | replace "+" "_" | trunc 63 | trimSuffix "-" }}
{{- end }}


{{- define "go-echocc5e866f-2954-4c93-9211-fdd76ff89ced.labels" -}}
helm.sh/chart: {{ include "go-echocc5e866f-2954-4c93-9211-fdd76ff89ced.chart" . }}
{{ include "go-echocc5e866f-2954-4c93-9211-fdd76ff89ced.selectorLabels" . }}
kubernetes.azure.com/generator: {{ .Values.generatorLabel }}
{{- if .Chart.AppVersion }}
app.kubernetes.io/version: {{ .Chart.AppVersion | quote }}
{{- end }}
app.kubernetes.io/managed-by: {{ .Release.Service }}
{{- end }}


{{- define "go-echocc5e866f-2954-4c93-9211-fdd76ff89ced.selectorLabels" -}}
app.kubernetes.io/name: {{ include "go-echocc5e866f-2954-4c93-9211-fdd76ff89ced.name" . }}
app.kubernetes.io/instance: {{ .Release.Name }}
{{- end }}