
{{- define "go-echo54ef7995-011e-424c-b80e-f85b98aa2def.name" -}}
{{- default .Chart.Name .Values.nameOverride | trunc 63 | trimSuffix "-" }}
{{- end }}


{{- define "go-echo54ef7995-011e-424c-b80e-f85b98aa2def.fullname" -}}
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


{{- define "go-echo54ef7995-011e-424c-b80e-f85b98aa2def.chart" -}}
{{- printf "%s-%s" .Chart.Name .Chart.Version | replace "+" "_" | trunc 63 | trimSuffix "-" }}
{{- end }}


{{- define "go-echo54ef7995-011e-424c-b80e-f85b98aa2def.labels" -}}
helm.sh/chart: {{ include "go-echo54ef7995-011e-424c-b80e-f85b98aa2def.chart" . }}
{{ include "go-echo54ef7995-011e-424c-b80e-f85b98aa2def.selectorLabels" . }}
kubernetes.azure.com/generator: {{ .Values.generatorLabel }}
{{- if .Chart.AppVersion }}
app.kubernetes.io/version: {{ .Chart.AppVersion | quote }}
{{- end }}
app.kubernetes.io/managed-by: {{ .Release.Service }}
{{- end }}


{{- define "go-echo54ef7995-011e-424c-b80e-f85b98aa2def.selectorLabels" -}}
app.kubernetes.io/name: {{ include "go-echo54ef7995-011e-424c-b80e-f85b98aa2def.name" . }}
app.kubernetes.io/instance: {{ .Release.Name }}
{{- end }}