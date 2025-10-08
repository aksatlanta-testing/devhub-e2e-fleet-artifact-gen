
{{- define "go-echoaa89933f-74a4-489d-a008-bfaa5338f828.name" -}}
{{- default .Chart.Name .Values.nameOverride | trunc 63 | trimSuffix "-" }}
{{- end }}


{{- define "go-echoaa89933f-74a4-489d-a008-bfaa5338f828.fullname" -}}
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


{{- define "go-echoaa89933f-74a4-489d-a008-bfaa5338f828.chart" -}}
{{- printf "%s-%s" .Chart.Name .Chart.Version | replace "+" "_" | trunc 63 | trimSuffix "-" }}
{{- end }}


{{- define "go-echoaa89933f-74a4-489d-a008-bfaa5338f828.labels" -}}
helm.sh/chart: {{ include "go-echoaa89933f-74a4-489d-a008-bfaa5338f828.chart" . }}
{{ include "go-echoaa89933f-74a4-489d-a008-bfaa5338f828.selectorLabels" . }}
kubernetes.azure.com/generator: {{ .Values.generatorLabel }}
{{- if .Chart.AppVersion }}
app.kubernetes.io/version: {{ .Chart.AppVersion | quote }}
{{- end }}
app.kubernetes.io/managed-by: {{ .Release.Service }}
{{- end }}


{{- define "go-echoaa89933f-74a4-489d-a008-bfaa5338f828.selectorLabels" -}}
app.kubernetes.io/name: {{ include "go-echoaa89933f-74a4-489d-a008-bfaa5338f828.name" . }}
app.kubernetes.io/instance: {{ .Release.Name }}
{{- end }}