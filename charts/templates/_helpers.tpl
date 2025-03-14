
{{- define "go-echo526502e8-b47f-4d68-bc3b-eba5e381b3ef.name" -}}
{{- default .Chart.Name .Values.nameOverride | trunc 63 | trimSuffix "-" }}
{{- end }}


{{- define "go-echo526502e8-b47f-4d68-bc3b-eba5e381b3ef.fullname" -}}
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


{{- define "go-echo526502e8-b47f-4d68-bc3b-eba5e381b3ef.chart" -}}
{{- printf "%s-%s" .Chart.Name .Chart.Version | replace "+" "_" | trunc 63 | trimSuffix "-" }}
{{- end }}


{{- define "go-echo526502e8-b47f-4d68-bc3b-eba5e381b3ef.labels" -}}
helm.sh/chart: {{ include "go-echo526502e8-b47f-4d68-bc3b-eba5e381b3ef.chart" . }}
{{ include "go-echo526502e8-b47f-4d68-bc3b-eba5e381b3ef.selectorLabels" . }}
kubernetes.azure.com/generator: {{ .Values.generatorLabel }}
{{- if .Chart.AppVersion }}
app.kubernetes.io/version: {{ .Chart.AppVersion | quote }}
{{- end }}
app.kubernetes.io/managed-by: {{ .Release.Service }}
{{- end }}


{{- define "go-echo526502e8-b47f-4d68-bc3b-eba5e381b3ef.selectorLabels" -}}
app.kubernetes.io/name: {{ include "go-echo526502e8-b47f-4d68-bc3b-eba5e381b3ef.name" . }}
app.kubernetes.io/instance: {{ .Release.Name }}
{{- end }}