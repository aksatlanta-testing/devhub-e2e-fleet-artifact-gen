
{{- define "go-echoaeb21ebd-d921-4129-8947-1ab421a92a53.name" -}}
{{- default .Chart.Name .Values.nameOverride | trunc 63 | trimSuffix "-" }}
{{- end }}


{{- define "go-echoaeb21ebd-d921-4129-8947-1ab421a92a53.fullname" -}}
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


{{- define "go-echoaeb21ebd-d921-4129-8947-1ab421a92a53.chart" -}}
{{- printf "%s-%s" .Chart.Name .Chart.Version | replace "+" "_" | trunc 63 | trimSuffix "-" }}
{{- end }}


{{- define "go-echoaeb21ebd-d921-4129-8947-1ab421a92a53.labels" -}}
helm.sh/chart: {{ include "go-echoaeb21ebd-d921-4129-8947-1ab421a92a53.chart" . }}
{{ include "go-echoaeb21ebd-d921-4129-8947-1ab421a92a53.selectorLabels" . }}
kubernetes.azure.com/generator: {{ .Values.generatorLabel }}
{{- if .Chart.AppVersion }}
app.kubernetes.io/version: {{ .Chart.AppVersion | quote }}
{{- end }}
app.kubernetes.io/managed-by: {{ .Release.Service }}
{{- end }}


{{- define "go-echoaeb21ebd-d921-4129-8947-1ab421a92a53.selectorLabels" -}}
app.kubernetes.io/name: {{ include "go-echoaeb21ebd-d921-4129-8947-1ab421a92a53.name" . }}
app.kubernetes.io/instance: {{ .Release.Name }}
{{- end }}