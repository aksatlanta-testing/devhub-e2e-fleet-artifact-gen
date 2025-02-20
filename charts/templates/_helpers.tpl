
{{- define "go-echo4014f025-df8f-4ba9-871c-131483af614c.name" -}}
{{- default .Chart.Name .Values.nameOverride | trunc 63 | trimSuffix "-" }}
{{- end }}


{{- define "go-echo4014f025-df8f-4ba9-871c-131483af614c.fullname" -}}
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


{{- define "go-echo4014f025-df8f-4ba9-871c-131483af614c.chart" -}}
{{- printf "%s-%s" .Chart.Name .Chart.Version | replace "+" "_" | trunc 63 | trimSuffix "-" }}
{{- end }}


{{- define "go-echo4014f025-df8f-4ba9-871c-131483af614c.labels" -}}
helm.sh/chart: {{ include "go-echo4014f025-df8f-4ba9-871c-131483af614c.chart" . }}
{{ include "go-echo4014f025-df8f-4ba9-871c-131483af614c.selectorLabels" . }}
kubernetes.azure.com/generator: {{ .Values.generatorLabel }}
{{- if .Chart.AppVersion }}
app.kubernetes.io/version: {{ .Chart.AppVersion | quote }}
{{- end }}
app.kubernetes.io/managed-by: {{ .Release.Service }}
{{- end }}


{{- define "go-echo4014f025-df8f-4ba9-871c-131483af614c.selectorLabels" -}}
app.kubernetes.io/name: {{ include "go-echo4014f025-df8f-4ba9-871c-131483af614c.name" . }}
app.kubernetes.io/instance: {{ .Release.Name }}
{{- end }}