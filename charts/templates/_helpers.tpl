
{{- define "go-echoecc95ea8-a5e5-41c7-9617-ca587e0ab234.name" -}}
{{- default .Chart.Name .Values.nameOverride | trunc 63 | trimSuffix "-" }}
{{- end }}


{{- define "go-echoecc95ea8-a5e5-41c7-9617-ca587e0ab234.fullname" -}}
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


{{- define "go-echoecc95ea8-a5e5-41c7-9617-ca587e0ab234.chart" -}}
{{- printf "%s-%s" .Chart.Name .Chart.Version | replace "+" "_" | trunc 63 | trimSuffix "-" }}
{{- end }}


{{- define "go-echoecc95ea8-a5e5-41c7-9617-ca587e0ab234.labels" -}}
helm.sh/chart: {{ include "go-echoecc95ea8-a5e5-41c7-9617-ca587e0ab234.chart" . }}
{{ include "go-echoecc95ea8-a5e5-41c7-9617-ca587e0ab234.selectorLabels" . }}
kubernetes.azure.com/generator: {{ .Values.generatorLabel }}
{{- if .Chart.AppVersion }}
app.kubernetes.io/version: {{ .Chart.AppVersion | quote }}
{{- end }}
app.kubernetes.io/managed-by: {{ .Release.Service }}
{{- end }}


{{- define "go-echoecc95ea8-a5e5-41c7-9617-ca587e0ab234.selectorLabels" -}}
app.kubernetes.io/name: {{ include "go-echoecc95ea8-a5e5-41c7-9617-ca587e0ab234.name" . }}
app.kubernetes.io/instance: {{ .Release.Name }}
{{- end }}